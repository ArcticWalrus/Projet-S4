#include "xparameters.h"
#include "xiicps.h"
#include "xil_printf.h"
#include "sleep.h"
#include "IMU_Defines.h"
#include "IMU_Functions.h"



int main(void)
{
	xil_printf("\r\nIMU OS demo\r\n");

	// I2C interface initialization in ZYNQ
	I2C_Interface_Init(I2C_DEVICE_ID);

	// Reset internal registers
	IMU_Device_Reset();
	IMU_Verify_ID();
	xil_printf("\r\n");

	// Disable sleep mode to wake the chip
	IMU_Disable_SleepMode();
	xil_printf("\r\n");

	// Verify if correct ID is read
	IMU_Verify_ID();
	xil_printf("\r\n");

	// Read some registers and compare their value to the datasheet
	IMU_ReadSomeRegisters();
	xil_printf("\r\n");

	int accel_y;

	xil_printf("ACCEL data\r\n");


	// Set acceleration Full Scale Range : 0 to 3
	IMU_Set_Accel_FSR(3);
	while(1)
	{
		accel_y =  IMU_Get_Accel_Y_value();
		sleep(1); // in seconds
	}

	// load DMP firmware
	//xil_printf("\r\nLoading DMP firmware...\r\n");
	//IMU_Load_DMP_firmware();

	return 0;
}








