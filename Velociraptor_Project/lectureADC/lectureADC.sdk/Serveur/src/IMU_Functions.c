/*
 * 		IMU_Functions.c : I2C interface functions to ICM20948
 * 		Adapted from TDK Invensense ICM20948 drivers https://www.invensense.com/products/motion-tracking/9-axis/icm-20948/
 *
 * 		IMU Demo - Atelier #3
 * 		Projet S4 informatique
 * 		Hiver 2019
 *
 *  	Author: Larissa Njejimana
 *  	21-02-2019
 *
 */

/***************************** Include Files **********************************/
#include "IMU_Functions.h"
/*****************************************************************************/


/************************** Variable Definitions ******************************/
XIicPs Iic; 				// Interface I2C
short accel_raw[3];			// 16-bit signed
float accel_XYZ[3];			// value in [g] Multiply by g = 9.81 m/s^2 if needed
u16 Accel_FSR;				// Full scale range [� g] = 2, 4, 8, 16
short gyro_raw[3];			// 16-bit signed
float gyro_XYZ[3];			// value in [dps]
u16 Gyro_FSR;				// Full scale range [� dps] = 250, 500, 1000, 2000

// DMP firmware image
static const uint8_t dmp3_image[] = {
#include "icm20948_img.dmp3a.h"
};
/*****************************************************************************/


/******************************************************************************/
/**
*  @brief      	Get accelerometer raw values on X, Y, Z axis
*
*  @param		None
*
*  @return     	0 if successful.
*******************************************************************************/
int IMU_Get_Accel_Raw_value()
{
	int Status;
	u8 RegVal[6];
	u32 ByteCount = 6;
	int j;

	// read 6 bytes starting from REG_ACCEL_XOUT_H
	Status = IMU_I2C_ReadReg(REG_ACCEL_XOUT_H, RegVal, ByteCount);
	if(Status != XST_SUCCESS)
	{
		xil_printf("Reading ACCEL raw data FAILED!\r\n");
		return -1;
	}

	// concatenate 8-MSB and 8-LSB for each axis
	for (j = 0; j < 3; j++)
	{
		accel_raw[j] = (RegVal[(2*j)]<<8) | (RegVal[(2*j)+ 1] & 0xff);
	}

	xil_printf("%6d  %6d  %6d\t |\t",accel_raw[0],accel_raw[1],accel_raw[2]);

	return 0;
}

int IMU_Get_Accel_Y_value()
{
    IMU_Get_Accel_Raw_value();
    xil_printf("%6d\n",accel_raw[1]);
    return accel_raw[1];
}

/******************************************************************************/
/**
*  @brief      	Convert accelerometer 16-bit raw value to [g]. 1g ~ 9.81 m/s^2
*
*  @param		None
*
*  @return     	0 if successful.
*******************************************************************************/
int Accel_raw_to_g_float()
{
	// on power-up it is set to 0 => 2G
	u16 FSR = Accel_FSR;
	int j;

	// accelG = accelRaw / ACCEL_Sensitivity(= 2^15/FSR )
	for (j = 0; j < 3; j++)
	{
		accel_XYZ[j] = ((float)accel_raw[j]) / (1<<15) * FSR;
	}

	printf("%3.2f  %3.2f  %3.2f\r\n",accel_XYZ[0],accel_XYZ[1],accel_XYZ[2]);

	return 0;
}


/******************************************************************************/
/**
*  @brief      	Set accelerometer Full Scale Range
*
*  @param		The new FSR
* 					newFSR = 0 => Accel_FSR = �2 g
* 					newFSR = 1 => Accel_FSR = �4 g
* 					newFSR = 2 => Accel_FSR = �8 g
* 					newFSR = 3 => Accel_FSR = �16 g
*
*  @return     	0 if successful.
*******************************************************************************/
int IMU_Set_Accel_FSR(u8 newFSR)
{
	u8 RegVal;
	u8 FSR;
	int Status;

	// we suppose that the bank has already been set to 2

	// verify configuration value ranges
	if(newFSR > 3)
	{
		xil_printf("ERROR Accel FSR config value out of range [0-3] \r\n");
		return -1;
	}

	// read current config
	Status = IMU_I2C_ReadReg(REG_ACCEL_CONFIG, &RegVal, 1);
	if(Status != XST_SUCCESS)
	{
		xil_printf("Reading ACCEL CONFIG register FAILED!\r\n");
		return -1;
	}

	// Extract FSR
	FSR = (RegVal & 0x06) >> 1;

	// verify if new FSR is already set
	if(FSR == newFSR)
	{
		Accel_FSR = 1 << (FSR + 1);
		xil_printf("Accel FSR correct value already set to %d  => +/- %d [g]\r\n", FSR, Accel_FSR);
		return 0;
	}
	xil_printf("Current FSR = %d  =>  New FSR = %d\r\n", FSR, newFSR);

	// only bit 2 and 1 need to be changed
	u8 newRegVal = (RegVal & 0xF9) | (newFSR << 1);

	// write new register value
	Status = IMU_I2C_WriteReg(REG_ACCEL_CONFIG, &newRegVal, 1);
	if (Status != XST_SUCCESS) {
		xil_printf("ACCEL FSR Setting FAILED!\r\n");
		return -1;
	}
	usleep(100);

	// Verify if new config correctly set
	// read current config
	IMU_I2C_ReadReg(REG_ACCEL_CONFIG, &RegVal, 1);
	// Extract FSR
	FSR = (RegVal & 0x06) >> 1;
	// verify if correct FSR is already set
	Accel_FSR = 1 << (FSR + 1);
	xil_printf("New Accel FSR = %d  => +/- %d [g]\r\n", FSR, Accel_FSR);

	return 0;
}



/******************************************************************************/
/**
*  @brief      	Get gyroscope raw values on X, Y, Z axis
*
*  @param		None
*
*  @return     	0 if successful.
*******************************************************************************/
int IMU_Get_Gyro_Raw_value()
{
	int Status;
	u8 RegVal[6];
	u32 ByteCount = 6;
	int j;

	// read 6 bytes starting from REG_GYRO_XOUT_H
	Status = IMU_I2C_ReadReg(REG_GYRO_XOUT_H, RegVal, ByteCount);
	if (Status != XST_SUCCESS) {
		xil_printf("Reading GYRO raw data FAILED!\r\n");
		return -1;
	}

	// concatenate 8-MSB and 8-LSB for each axis
	for (j = 0; j < 3; j++)
	{
		gyro_raw[j] = (RegVal[(2*j)]<<8) | (RegVal[(2*j)+ 1] & 0xff);
	}

	xil_printf("%6d  %6d  %6d\t |\t",gyro_raw[0],gyro_raw[1],gyro_raw[2]);

	return 0;
}



/******************************************************************************/
/**
*  @brief      	Convert gyroscope 16-bit raw value to [dps] (degree per second)
*
*  @param		None
*
*  @return     	0 if successful.
*******************************************************************************/
int Gyro_raw_to_dps_float()
{
	// on power-up it is set to 0 => 250
	u16 FSR = Gyro_FSR;
	int j;

	// gyro_dps = Gyro_Raw / GYRO_Sensitivity(= 2^15/FSR )
	for (j = 0; j < 3; j++)
	{
		gyro_XYZ[j] = ((float)gyro_raw[j]) / (1<<15) * FSR;
	}

	printf("%02.2f  %02.2f  %02.2f\r\n",gyro_XYZ[0],gyro_XYZ[1],gyro_XYZ[2]);

	return 0;
}


/******************************************************************************/
/**
*  @brief      	Set Gyroscope Full Scale Range
*
*  @param		The new FSR
* 					newFSR = 0 => Gyro_FSR = �250 dps
* 					newFSR = 1 => Gyro_FSR = �500 dps
* 					newFSR = 2 => Gyro_FSR = �1000 dps
* 					newFSR = 3 => Gyro_FSR = �2000 dps
*
*  @return     	0 if successful.
*******************************************************************************/
int IMU_Set_Gyro_FSR(u8 newFSR)
{
	u8 RegVal;
	u8 FSR;
	int Status;

	// we suppose that the bank has already been set to 2

	// verify configuration value ranges
	if(newFSR > 3)
	{
		xil_printf("ERROR GYRO FSR config value out of range [0-3] \r\n");
		return -1;
	}

	// read current config
	Status = IMU_I2C_ReadReg(REG_GYRO_CONFIG, &RegVal, 1);
	if(Status != XST_SUCCESS)
	{
		xil_printf("Reading GYRO CONFIG register FAILED!\r\n");
		return -1;
	}

	// Extract FSR
	FSR = (RegVal & 0x06) >> 1;

	// verify if correct FSR is already set
	if(FSR == newFSR)
	{
		Gyro_FSR = (1 << FSR) * 250;
		xil_printf("GYRO FSR correct value already set to %d  => +/- %d [dps]\r\n", FSR, Gyro_FSR);
		return 0;
	}

	xil_printf("Current FSR = %d  =>  New FSR = %d\r\n", FSR, newFSR);

	// only bit 2 and 1 need to be changed
	u8 newRegVal = (RegVal & 0xF9) | (newFSR << 1);

	// write new register value
	Status = IMU_I2C_WriteReg(REG_GYRO_CONFIG, &newRegVal, 1);
	if (Status != XST_SUCCESS) {
		xil_printf("ACCEL FSR Setting FAILED!\r\n");
		return -1;
	}
	usleep(100);

	// Verify if new config correctly set
	// read current config
	IMU_I2C_ReadReg(REG_GYRO_CONFIG, &RegVal, 1);
	// Extract FSR
	FSR = (RegVal & 0x06) >> 1;
	// verify if correct FSR is already set
	Gyro_FSR = (1 << FSR) * 250;
	xil_printf("New GYRO FSR %d  => +/- %d [dps]\r\n", FSR, Gyro_FSR);

	return 0;
}


/******************************************************************************/
/**
*  @brief      	Load firmware into DMP (Digital Motion Processor).
*  				The firmware is found in dmp3_image
*
*  @param		None
*
*  @return     	0 if successful.
*******************************************************************************/
int IMU_Load_DMP_firmware()
{
    int write_size;
    int result;
    const unsigned char *data;
    unsigned short size;
    unsigned short memaddr;
    unsigned char data_cmp[INV_MAX_SERIAL_READ];
    int flag = 0;

    data = dmp3_image;
    size = sizeof(dmp3_image);
    memaddr = DMP_LOAD_START;

    while (size > 0) {
        write_size = (size < INV_MAX_SERIAL_WRITE) ? size:INV_MAX_SERIAL_WRITE;
        if ((memaddr & 0xff) + write_size > 0x100) {
            // Moved across a bank
            write_size = (memaddr & 0xff) + write_size - 0x100;
        }
        result = IMU_Write_DMP(memaddr, write_size, (unsigned char *)data);
        if (result)
            return result;
        data += write_size;
        size -= write_size;
        memaddr += write_size;
    }

    // Verify DMP memory
    data = dmp3_image;
    size = sizeof(dmp3_image);
    memaddr = DMP_LOAD_START;
    while (size > 0) {
        write_size = (size < INV_MAX_SERIAL_READ) ? size:INV_MAX_SERIAL_READ;
        if ((memaddr & 0xff) + write_size > 0x100) {
            // Moved across a bank
            write_size = (memaddr & 0xff) + write_size - 0x100;
        }
        result = IMU_Read_DMP(memaddr, write_size, data_cmp);
        if (result)
            flag++; // Error, DMP not written correctly
        if (memcmp(data_cmp, data, write_size))
            return -1;
        data += write_size;
        size -= write_size;
        memaddr += write_size;
    }


    if(!flag)
    	xil_printf("DMP firmware was updated successfully!\r\n");
    else
    	xil_printf("DMP firmware loading failed!\r\n");
    return 0;
}

/******************************************************************************/
/**
*  @brief      	Read a few IMU registers
*  				Can be used to verify if communication is well established by
*  				comparing their values to the ICM20948 datasheet
*
*  @param		None
*
*  @return     	None
*******************************************************************************/
void IMU_ReadSomeRegisters()
{
	u8 data[1] = {0};

	IMU_I2C_ReadReg(REG_WHO_AM_I, data, 1);
	xil_printf("REG_WHO_AM_I => 0x%X\r\n", *data);

	IMU_I2C_ReadReg(REG_USER_CTRL, data, 1);
	xil_printf("REG_USER_CTRL => 0x%X\r\n", *data);

	IMU_I2C_ReadReg(REG_PWR_MGMT_1, data, 1);
	xil_printf("REG_PWR_MGMT_1 => 0x%X\r\n", *data);

	IMU_I2C_ReadReg(REG_PWR_MGMT_2, data, 1);
	xil_printf("REG_PWR_MGMT_2 => 0x%X\r\n", *data);

	IMU_I2C_ReadReg(REG_LP_CONFIG, data, 1);
	xil_printf("REG_LP_CONFIG => 0x%X\r\n", *data);
}


/******************************************************************************/
/**
*  @brief      	Verify if correct ID (i.e. 0xEA) was read
*
*  @param		None
*
*  @return     	0 if successful.
*******************************************************************************/
int IMU_Verify_ID()
{
	u8 data[1] = {0};

	IMU_I2C_ReadReg(REG_WHO_AM_I, data, 1);
	xil_printf("REG_WHO_AM_I => 0x%X\r\n", *data);

	if(*data == IMU_WHOAMI_REG_VAL)
	{
		xil_printf("ID verification PASSED!\r\n");
		return 0;
	}
	else
	{
		xil_printf("ID verification FAILED! => 0x%X\r\n", *data);
		return -1;
	}

}


/******************************************************************************/
/**
*  @brief      	Read data from a register in DMP memory
*
*  @param		DMP memory address
*  @param		number of byte to be read
*  @param		input data from the register
*
*  @return     	0 if successful.
*******************************************************************************/
int IMU_Read_DMP(unsigned short reg, unsigned int length, unsigned char *data)
{
	int result = 0;
	unsigned int bytesWritten = 0;
	unsigned int thisLen;
	unsigned char lBankSelected;
	unsigned char lStartAddrSelected;

	if(!data)
		return -1;

	result |= IMU_Set_Bank(0);

	// select Memory Bank
	lBankSelected = (reg >> 8);
	result |= IMU_I2C_WriteReg(REG_MEM_BANK_SEL, &lBankSelected, 1);
	if (result)
		return result;


	while (bytesWritten < length)
	{
		lStartAddrSelected = (reg & 0xff);
		/* Sets the starting read or write address for the selected memory, inside of the selected page (see MEM_SEL Register).
		Contents are changed after read or write of the selected memory.
		This register must be written prior to each access to initialize the register to the proper starting address.
		The address will auto increment during burst transactions.  Two consecutive bursts without re-initializing the start address would skip one address. */
		result |= IMU_I2C_WriteReg(REG_MEM_START_ADDR, &lStartAddrSelected, 1);
		if (result)
			return result;

		thisLen = (INV_MAX_SERIAL_READ < length-bytesWritten) ? INV_MAX_SERIAL_READ:length-bytesWritten;

		/* Read data */
		result |= IMU_I2C_ReadReg(REG_MEM_R_W, &data[bytesWritten], thisLen);

		if (result)
			return result;

		bytesWritten += thisLen;
		reg += thisLen;
	}

	return result;
}


/******************************************************************************/
/**
*  @brief      	Write data from a register in DMP memory
*
*  @param		DMP memory address
*  @param		number of byte to be written
*  @param		ouput data from the register
*
*  @return     	0 if successful.
*******************************************************************************/
int IMU_Write_DMP(unsigned short reg, unsigned int length, unsigned char *data)
{
	int result=0;
	unsigned int bytesWritten = 0;
	unsigned int thisLen;
	unsigned char lBankSelected;
	unsigned char lStartAddrSelected;

	result |= IMU_Set_Bank(0);

	// select Memory Bank
	lBankSelected = (reg >> 8);
	result |= IMU_I2C_WriteReg(REG_MEM_BANK_SEL, &lBankSelected, 1);
	if (result)
		return result;


	while (bytesWritten < length)
	{
		lStartAddrSelected = (reg & 0xff);
		/* Sets the starting read or write address for the selected memory, inside of the selected page (see MEM_SEL Register).
		Contents are changed after read or write of the selected memory.
		This register must be written prior to each access to initialize the register to the proper starting address.
		The address will auto increment during burst transactions.  Two consecutive bursts without re-initializing the start address would skip one address. */
		result |= IMU_I2C_WriteReg(REG_MEM_START_ADDR, &lStartAddrSelected, 1);
		if (result)
			return result;

		thisLen = (INV_MAX_SERIAL_WRITE < length-bytesWritten) ? INV_MAX_SERIAL_WRITE:length-bytesWritten;

		/* Write data */
		result |= IMU_I2C_WriteReg(REG_MEM_R_W, &data[bytesWritten], thisLen);
		if (result)
			return result;

		bytesWritten += thisLen;
		reg += thisLen;
	}

	return result;
}


/******************************************************************************/
/**
*  @brief      	Write data to a register in the IMU
*
*  @param		Register Address
*  @param		Data to write
*  @param		Number of bytes to write.
*  				It is 0 when no data will be written (a read request for example)
*
*  @return     	0 if successful.
*******************************************************************************/
int IMU_I2C_WriteReg(u16 Reg_Addr, u8* data, int byteCount)
{
	int Status;

	// first set correct bank

	u8 bank = Reg_Addr >> 7;
	Status = IMU_Set_Bank(bank);
	if (Status != XST_SUCCESS)
	{
		xil_printf("Setting Bank FAILED!\r\n");
		return -1;
	}

	u8 writeBuffer[byteCount+1]; 		// +1 because address will contain the register address

	writeBuffer[0] = Reg_Addr & 0x7F; 	// keep register only (i.e. remove Bank value)

	if(byteCount > 0)
		memcpy(writeBuffer+1, data, byteCount);

	Status = XIicPs_MasterSendPolled(&Iic, writeBuffer, byteCount+1, IMU_I2C_ADDRESS);

	return Status;

}



/******************************************************************************/
/**
*  @brief      	Read data from a register in the IMU
*
*  @param		Register Address
*  @param		Pointer to the receive buffer
*  @param		Number of bytes to read.
*
*  @return     	0 if successful.
*******************************************************************************/
int IMU_I2C_ReadReg(u16 Reg_Addr, u8* data, int byteCount)
{
	int Status;

	if(byteCount < 1)
	{
		xil_printf("Byte count must be at least 1!\r\n");
		return -1;
	}

	// first send request to read the register
	Status = IMU_I2C_WriteReg(Reg_Addr, 0, 0);
	if(Status != XST_SUCCESS)
	{
		xil_printf("Read : access to register FAILED!\r\n");
		return -1;
	}

	Status = XIicPs_MasterRecvPolled(&Iic, data, byteCount, IMU_I2C_ADDRESS);

	usleep(100);
	return Status;
}




/******************************************************************************/
/**
*  @brief      	Set bank in the IMU
*
*  @param		Bank number
*
*  @return     	0 if successful.
*******************************************************************************/
int IMU_Set_Bank(u8 bank)
{
	u8 currentBankREG, newBankREG;
	u8 currentBankNb;

	if(bank > 3)
	{
		xil_printf("Wrong bank number! Has to be between 0 and 3!\r\n");
		return -1;
	}

	// read register
	IMU_Get_Bank(&currentBankREG);

	// verify if correct bank is already set
	currentBankNb = (currentBankREG & 0x30)>>4;
	if(currentBankNb == bank)
	{
		//xil_printf("Bank already set to %d\r\n", currentBankNb);
		return 0;
	}

	// only bit 5 and 4 need to be changed
	newBankREG = (currentBankREG & 0xCF) | (bank << 4);

	u8 WriteBuffer[2];
	// write the new value
	WriteBuffer[0] = REG_BANK_SEL;
	WriteBuffer[1] = newBankREG;
	int ByteCount = 2;
	int Status;

	Status = XIicPs_MasterSendPolled(&Iic, WriteBuffer, ByteCount, IMU_I2C_ADDRESS);
	if (Status != XST_SUCCESS)
	{
		xil_printf("IMU ICM20948 Setting bank to %d FAILED*!\r\n", bank);
		return -1;
	}
	usleep(100);

	// Verify if bank correctly set
	IMU_Get_Bank(&currentBankREG);
	currentBankNb = (currentBankREG & 0x30)>>4;
	if(currentBankNb != bank)
	{
		xil_printf("IMU ICM20948 Setting bank to %d FAILED**!\r\n", bank);
		return -1;
	}
	else
	{
		//xil_printf("IMU ICM20948 bank setting to %d PASSED!!\r\n", bank);
		return 0;
	}

}


/******************************************************************************/
/**
*  @brief      	Get current bank in the IMU
*
*  @param		Pointer to the read bank number
*
*  @return     	0 if successful.
*******************************************************************************/
int IMU_Get_Bank(u8* bank)
{
	int Status;
	u32 ByteCount = 1;

	u8 RegAddr[1];
	u8 RegVal;

	RegAddr[0] = (u8)REG_BANK_SEL;

	Status = XIicPs_MasterSendPolled(&Iic, RegAddr, ByteCount, IMU_I2C_ADDRESS);
	if (Status != XST_SUCCESS)
	{
		xil_printf("REG_BANK_SEL XIicPs_MasterSendPolled FAILED!\r\n");
		return -1;
	}

	Status = XIicPs_MasterRecvPolled(&Iic, &RegVal, ByteCount, IMU_I2C_ADDRESS);
	if (Status != XST_SUCCESS)
	{
		xil_printf("REG_BANK_SEL XIicPs_MasterRecvPolled FAILED!\r\n");
		return -1;
	}

	*bank = RegVal;

	//xil_printf("REG_BANK_SEL register = 0x%02X, Bank = %x\r\n",RegVal, (RegVal & 0x30)>>4);
	usleep(100);
	return 0;
}


/******************************************************************************/
/**
*  @brief      	Disable IMU sleep mode of IMU to wake the chip upon power up
*
*  @param		None
*
*  @return     	0 if successful.
*******************************************************************************/
int IMU_Disable_SleepMode()
{
	int Status;
	u8 data[1];

	// first read the current value of the register
	Status = IMU_I2C_ReadReg(REG_PWR_MGMT_1, data, 1);
	if (Status != XST_SUCCESS)
	{
		xil_printf("Reading register REG_PWR_MGMT_1 FAILED!\r\n");
		return -1;
	}

	// clear the sleep bit
	*data &= ~BIT_SLEEP;

	// write the new register value
	Status = IMU_I2C_WriteReg(REG_PWR_MGMT_1, data, 1);
	if (Status != XST_SUCCESS)
	{
		xil_printf("Disabling sleep mode FAILED!\r\n");
		return -1;
	}
	else
	{
		xil_printf("Disabling sleep mode PASSED => Chip Awake!\r\n");
		return 0;
	}
}


/******************************************************************************/
/**
*  @brief      	Reset the internal registers and restores the default settings
*
*  @param		None
*
*  @return     	0 if successful.
*******************************************************************************/
int IMU_Device_Reset()
{
	int Status;
	u8 data[1];

	// Reset the internal registers and restores the default settings
	data[0] = BIT_DEVICE_RESET|BIT_CLKSEL;
	Status = IMU_I2C_WriteReg(REG_PWR_MGMT_1, data, 1);
	if (Status != XST_SUCCESS)
	{
		xil_printf("Resetting IMU internal registers FAILED!\r\n");
		return -1;
	}
	else
	{
		xil_printf("Resetting IMU internal registers PASSED!\r\n");
		usleep(POWER_UP_TIME);

		//set accelerometer full scale range
		IMU_Set_Accel_FSR(0);

		//set gyroscope full scale range
		IMU_Set_Gyro_FSR(0);
		return 0;
	}

}


/******************************************************************************/
/**
*  @brief      	Initialization of the I2C interface on the board
*
*  @param		DeviceId is the ID of the IicPs Device and
*  				is the XPAR_<IICPS_instance>_DEVICE_ID value from xparameters.h
*
*  @return     	0 if successful.
*******************************************************************************/
int I2C_Interface_Init(u16 DeviceId)
{

	int Status;
	XIicPs_Config *Config;

	/*
	 * Initialize the IIC driver so that it's ready to use
	 * Look up the configuration in the config table, then initialize it.
	 */
	Config = XIicPs_LookupConfig(DeviceId);
	if (NULL == Config) {
		return XST_FAILURE;
	}

	Status = XIicPs_CfgInitialize(&Iic, Config, Config->BaseAddress);
	if (Status != XST_SUCCESS) {
		xil_printf("I2C interface Initialization FAILED\r\n");
		return XST_FAILURE;
	}

	xil_printf("I2C interface Initialization PASSED!\r\n");

	/*
	 * Perform a self-test to ensure that the hardware was built correctly.
	 */
	Status = XIicPs_SelfTest(&Iic);
	if (Status != XST_SUCCESS) {
		xil_printf("I2C interface Self-Test FAILED\r\n");
		return XST_FAILURE;
	}

	xil_printf("I2C interface Self-Test PASSED!\r\n");


	/*
	 * Set the I2C serial clock rate.
	 */
	Status = XIicPs_SetSClk(&Iic, IIC_SCLK_RATE);
	if (Status == XST_DEVICE_IS_STARTED) {
		xil_printf("I2C interface clock rate not set due to ongoing data transfer!\r\n");
	}
	else if(Status == XST_FAILURE){
		xil_printf("I2C interface clock rate setting FAILED!\r\n");
		return XST_FAILURE;
	}

	xil_printf("I2C interface clock rate setting PASSED!\r\n\r\n");

	XIicPs_DisableAllInterrupts(I2C_BASEADDR);

	return XST_SUCCESS;
}


