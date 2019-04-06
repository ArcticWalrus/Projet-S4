/*
 * 		IMU_Defines.h :
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

#ifndef SRC_IMU_DEFINES_H_
#define SRC_IMU_DEFINES_H_

/************************** Constant Definitions ******************************/
#define I2C_DEVICE_ID						XPAR_XIICPS_0_DEVICE_ID
#define I2C_BASEADDR						XPAR_XIICPS_0_BASEADDR
#define IMU_I2C_ADDRESS     				0x68
#define IIC_SCLK_RATE						100000 	// 100 KHz, 400 KHz
#define IMU_WHOAMI_REG_VAL					0xEA
#define POWER_UP_TIME 						100000	// 100 ms

#define DMP_START_ADDRESS   				((unsigned short)0x1000)
#define DMP_MEM_BANK_SIZE   				256
#define DMP_LOAD_START      				0x90
#define DMP_CODE_SIZE 14250

#define INV_MAX_SERIAL_READ 				16 // Max size that can be read across I2C or SPI data lines
#define INV_MAX_SERIAL_WRITE 				16 // Max size that can be written across I2C or SPI data lines

/************************** IMU registers ******************************/
#define BANK_0                  (0 << 7)
#define BANK_1                  (1 << 7)
#define BANK_2                  (2 << 7)
#define BANK_3                  (3 << 7)

/*register and associated bit definition*/
/* bank 0 register map */
#define REG_WHO_AM_I            (BANK_0 | 0x00)

#define REG_USER_CTRL           (BANK_0 | 0x03)
#define   BIT_DMP_EN                      0x80
#define   BIT_FIFO_EN                     0x40
#define   BIT_I2C_MST_EN                  0x20
#define   BIT_I2C_IF_DIS                  0x10
#define   BIT_DMP_RST                     0x08
#define   BIT_SRAM_RST			   	 	  0x04
#define   BIT_I2C_MST_RST			   	  0x02

#define REG_LP_CONFIG           (BANK_0 | 0x05)
#define   BIT_I2C_MST_CYCLE               0x40
#define   BIT_ACCEL_CYCLE                 0x20
#define   BIT_GYRO_CYCLE                  0x10

#define REG_PWR_MGMT_1          (BANK_0 | 0x06)
#define   BIT_DEVICE_RESET                0x80
#define   BIT_SLEEP                       0x40
#define   BIT_LP_EN                       0x20
#define   BIT_TEMP_DIS					  0x08
#define   BIT_CLKSEL                      0x01

#define REG_PWR_MGMT_2          (BANK_0 | 0x07)
#define   BIT_DISABLE_ACCEL               0x38
#define   BIT_DISABLE_GYRO	              0x07
#define   BIT_DISABLE_ALL                 0x7f

#define REG_INT_PIN_CFG         (BANK_0 | 0x0F)
#define   BIT_INT_LATCH_EN                0x20
#define   BIT_BYPASS_EN                   0x02

#define REG_INT_ENABLE          (BANK_0 | 0x10)
#define   BIT_DMP_INT_EN                  0x02

#define REG_INT_ENABLE_1        (BANK_0 | 0x11)
#define   BIT_DATA_RDY_0_EN               0x01

#define REG_INT_ENABLE_2        (BANK_0 | 0x12)
#define   BIT_FIFO_OVERFLOW_EN_0          0x1

#define REG_INT_ENABLE_3        (BANK_0 | 0x13)

#define REG_I2C_MST_STATUS      (BANK_0 | 0x17)

#define REG_INT_STATUS          (BANK_0 | 0x19)
#define   BIT_DMP_INT                     0x02
#define   BIT_I2C_MST_INT                 0x01

#define REG_INT_STATUS_1        (BANK_0 | 0x1A)
#define REG_INT_STATUS_2        (BANK_0 | 0x1B)
#define REG_INT_STATUS_3        (BANK_0 | 0x1C)

#define REG_ACCEL_XOUT_H    	(BANK_0 | 0x2D)
#define REG_ACCEL_XOUT_L     	(BANK_0 | 0x2E)
#define REG_ACCEL_YOUT_H     	(BANK_0 | 0x2F)
#define REG_ACCEL_YOUT_L     	(BANK_0 | 0x30)
#define REG_ACCEL_ZOUT_H     	(BANK_0 | 0x31)
#define REG_ACCEL_ZOUT_L     	(BANK_0 | 0x32)

#define REG_GYRO_XOUT_H      	(BANK_0 | 0x33)
#define REG_GYRO_XOUT_L      	(BANK_0 | 0x34)
#define REG_GYRO_YOUT_H      	(BANK_0 | 0x35)
#define REG_GYRO_YOUT_L      	(BANK_0 | 0x36)
#define REG_GYRO_ZOUT_H      	(BANK_0 | 0x37)
#define REG_GYRO_ZOUT_L      	(BANK_0 | 0x38)

#define REG_TEMP_OUT_H         	(BANK_0 | 0x39)
#define REG_TEMP_OUT_L         	(BANK_0 | 0x3A)

#define REG_FIFO_EN             (BANK_0 | 0x66)
#define   BIT_SLV_0_FIFO_EN               0x01

#define REG_FIFO_EN_2           (BANK_0 | 0x67)
#define   BIT_ACCEL_FIFO_EN               0x10
#define   BIS_GYRO_FIFO_EN                0x0E
#define   BIT_TEMP_FIFO_EN                0x01

#define REG_FIFO_RST            (BANK_0 | 0x68)
#define REG_FIFO_MODE           (BANK_0 | 0x69)

#define REG_FIFO_COUNT_H        (BANK_0 | 0x70)
#define REG_FIFO_COUNT_L        (BANK_0 | 0x71)
#define REG_FIFO_R_W            (BANK_0 | 0x72)

#define DATA_RDY_STATUS         (BANK_0 | 0x74)

#define REG_FIFO_CFG            (BANK_0 | 0x76)
#define   BIT_MULTI_FIFO_CFG              0x01
#define   BIT_SINGLE_FIFO_CFG             0x00

#define REG_MEM_START_ADDR      (BANK_0 | 0x7C)
#define REG_MEM_R_W             (BANK_0 | 0x7D)
#define REG_MEM_BANK_SEL        (BANK_0 | 0x7E)

/* bank 1 register map */
#define REG_SELF_X_GYRO    		(BANK_1 | 0x02)
#define REG_SELF_Y_GYRO     	(BANK_1 | 0x03)
#define REG_SELF_Z_GYRO      	(BANK_1 | 0x04)

#define REG_SELF_X_ACCEL     	(BANK_1 | 0x0E)
#define REG_SELF_Y_ACCEL    	(BANK_1 | 0x0F)
#define REG_SELF_Z_ACCEL     	(BANK_1 | 0x10)

#define REG_XA_OFFS_H      		(BANK_1 | 0x14)
#define REG_XA_OFFS_L        	(BANK_1 | 0x15)
#define REG_YA_OFFS_H         	(BANK_1 | 0x17)
#define REG_YA_OFFS_L     		(BANK_1 | 0x18)
#define REG_ZA_OFFS_H       	(BANK_1 | 0x1A)
#define REG_ZA_OFFS_L      		(BANK_1 | 0x1B)


/* bank 2 register map */
#define REG_GYRO_SMPLRT_DIV     (BANK_2 | 0x00)

#define REG_GYRO_CONFIG         (BANK_2 | 0x01)
#define   BIT_GYRO_DLPCFG                 0x38
#define   BIT_GYRO_FS_SEL                 0x06
#define   BIT_GYRO_FCHOICE 				  0x01

#define REG_GYRO_CONFIG_2       (BANK_2 | 0x02)
#define   BIT_GYRO_CTEN                   0x38
#define   BIT_GYRO_AVGCFG				  0x07

#define REG_XG_OFFS_USR_H       (BANK_2 | 0x03)
#define REG_YG_OFFS_USR_H       (BANK_2 | 0x05)
#define REG_ZG_OFFS_USR_H       (BANK_2 | 0x07)

#define REG_ODR_ALIGN_EN 		(BANK_2 | 0x09)

#define REG_ACCEL_SMPLRT_DIV_1  (BANK_2 | 0x10)
#define REG_ACCEL_SMPLRT_DIV_2  (BANK_2 | 0x11)

#define REG_ACCEL_CONFIG        (BANK_2 | 0x14)
#define   BIT_ACCEL_DLPCFG                0x38
#define   BIT_ACCEL_FS_SEL                0x06
#define   BIT_ACCEL_FCHOICE 			  0x01

#define REG_ACCEL_CONFIG_2      (BANK_2 | 0x15)
#define   BIT_ACCEL_ST_EN                 0x1C
#define   BIT_ACCEL_DEC3_CFG              0x02

#define REG_TEMP_CONFIG       	(BANK_2 | 0x53)

#define REG_PRGM_START_ADDRH    (BANK_2 | 0x50)
#define REG_MOD_CTRL_USR        (BANK_2 | 0x54)

/* bank 3 register map */
#define REG_I2C_MST_ODR_CONFIG  (BANK_3 | 0x0)

#define REG_I2C_MST_CTRL        (BANK_3 | 0x01)
#define   BIT_MULT_MST_EN              	  0x80
#define   BIT_I2C_MST_P_NSR               0x10
#define   BIT_I2C_MST_CLK                 0x0F

#define REG_I2C_MST_DELAY_CTRL  (BANK_3 | 0x02)
#define   BIT_SLV0_DLY_EN                 0x01
#define   BIT_SLV1_DLY_EN                 0x02
#define   BIT_SLV2_DLY_EN                 0x04
#define   BIT_SLV3_DLY_EN                 0x08
#define   BIT_SLV4_DLY_EN                 0x10
#define   BIT_DELAY_ES_SHADOW             0x80

#define REG_I2C_SLV0_ADDR       (BANK_3 | 0x03)
#define REG_I2C_SLV0_REG        (BANK_3 | 0x04)
#define REG_I2C_SLV0_CTRL       (BANK_3 | 0x05)
#define REG_I2C_SLV0_DO         (BANK_3 | 0x06)

#define REG_I2C_SLV1_ADDR       (BANK_3 | 0x07)
#define REG_I2C_SLV1_REG        (BANK_3 | 0x08)
#define REG_I2C_SLV1_CTRL       (BANK_3 | 0x09)
#define REG_I2C_SLV1_DO         (BANK_3 | 0x0A)

#define REG_I2C_SLV2_ADDR       (BANK_3 | 0x0B)
#define REG_I2C_SLV2_REG        (BANK_3 | 0x0C)
#define REG_I2C_SLV2_CTRL       (BANK_3 | 0x0D)
#define REG_I2C_SLV2_DO         (BANK_3 | 0x0E)

#define REG_I2C_SLV3_ADDR       (BANK_3 | 0x0F)
#define REG_I2C_SLV3_REG        (BANK_3 | 0x10)
#define REG_I2C_SLV3_CTRL       (BANK_3 | 0x11)
#define REG_I2C_SLV3_DO         (BANK_3 | 0x12)

#define REG_I2C_SLV4_ADDR       (BANK_3 | 0x13)
#define REG_I2C_SLV4_REG        (BANK_3 | 0x14)
#define REG_I2C_SLV4_CTRL       (BANK_3 | 0x15)
#define REG_I2C_SLV4_DO         (BANK_3 | 0x16)
#define REG_I2C_SLV4_DI         (BANK_3 | 0x17)


/* register for all banks */
#define REG_BANK_SEL            0x7F
#define BIT_BANK_SEL 			0x30


#endif /* SRC_IMU_DEFINES_H_ */
