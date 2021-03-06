/*
 * main.c
 *
 *  Created on: Feb 20, 2019
 *      Author: njel3001
 */



#include <xgpio.h>
#include <stdio.h>
#include "xil_printf.h"
#include "xparameters.h"
#include "sleep.h"
#include "PmodGPIO.h"
#include "PmodOLED.h"
#include "myip.h"
#include "myIO_IP.h"

u16 AD1_GetSampleRaw();
float AD1_GetSampleVoltage();
u16 Speed_GetSampleRaw();
float Speed_GetSampleValue();
u16 Distance_GetSampleRaw();
float Distance_GetSampleValue();
u16 Calorie_GetSampleRaw();
float Calorie_GetSampleValue();
void DisplayVoltage(float value, char *voltage_char);

#define MY_AD1_IP_BASEADDRESS  XPAR_MYIP_0_S00_AXI_BASEADDR

#define MY_VITESSE_IP_BASEADDRESS  XPAR_MYIO_IP_0_S00_AXI_BASEADDR
#define MY_DISTANCE_IP_BASEADDRESS  XPAR_MYIO_IP_1_S00_AXI_BASEADDR
#define MY_CALORIE_IP_BASEADDRESS  XPAR_MYIO_IP_2_S00_AXI_BASEADDR

#define AD1_NUM_BITS 	12

const float ReferenceVoltage = 3.3;


int main()
{
	XGpio inputSW, outputLED;
	PmodGPIO pmod8LD;
	PmodOLED oledDevice;
	int sw_data = 0;
	u8 pmod8LDvalue = 0;
	float currentData = 0;
	float currentVoltage = 0;
	char dataChar[5];

    print("Bienvenue\n\r");


    // Initialiser AXI_GPIO  IPs
	XGpio_Initialize(&inputSW, XPAR_AXI_GPIO_0_DEVICE_ID);		// switches
	XGpio_Initialize(&outputLED, XPAR_AXI_GPIO_1_DEVICE_ID);	// leds

	XGpio_SetDataDirection(&inputSW, 1, 0xF); 		//Fixer la direction du port 1 de l'AXI_GPIO_0 comme input
	XGpio_SetDataDirection(&outputLED, 1, 0x0);		//Fixer la direction du port 1 de l'AXI_GPIO_1 comme output

	// Initialiser PmodGPIO pour le Pmod_8LD
	GPIO_begin(&pmod8LD, XPAR_PMODGPIO_0_AXI_LITE_GPIO_BASEADDR, 0x00);

	// Initialiser le Pmod Oled
	OLED_Begin(&oledDevice, XPAR_PMODOLED_0_AXI_LITE_GPIO_BASEADDR, XPAR_PMODOLED_0_AXI_LITE_SPI_BASEADDR, 0, 0);
	// D�sactiver la mise � jour automatique de l'�cran de l'OLED
	OLED_SetCharUpdate(&oledDevice, 0);
	// Pr�parer l'�cran pour afficher l'�tat des boutons et des switch
	OLED_ClearBuffer(&oledDevice);

	OLED_Update(&oledDevice);

	print("Initialisation finie\n\r");

	while(1){

		// Lire puis afficher les valeurs des switch sur les leds
		sw_data = XGpio_DiscreteRead(&inputSW, 1);
		XGpio_DiscreteWrite(&outputLED, 1, sw_data);
		//xil_printf("Switch value = 0x%X\n\r", sw_data);

		currentVoltage= AD1_GetSampleVoltage();

		// lire la tension provenant du PmodAD1
		if(sw_data == 0){
			OLED_ClearBuffer(&oledDevice);
			currentData = Speed_GetSampleValue();
			OLED_SetCursor(&oledDevice, 0, 3);
			OLED_PutString(&oledDevice, "Vitesse = ");
			// Affichage de la vitesse sur le Pmod OLED
			sprintf(dataChar,"%2.2f",currentData);
			OLED_SetCursor(&oledDevice, 10, 3);
			OLED_PutString(&oledDevice, dataChar);
			OLED_Update(&oledDevice);
		}
		else if (sw_data == 1){
			OLED_ClearBuffer(&oledDevice);
			currentData = Distance_GetSampleValue();
			OLED_SetCursor(&oledDevice, 0, 3);
			OLED_PutString(&oledDevice, "Distance = ");
			// Affichage de la distance sur le Pmod OLED
			sprintf(dataChar,"%2.2f",currentData);
			OLED_SetCursor(&oledDevice, 11, 3);
			OLED_PutString(&oledDevice, dataChar);
			OLED_Update(&oledDevice);
		}
		else if (sw_data == 2){
			OLED_ClearBuffer(&oledDevice);
			currentData = Calorie_GetSampleValue();
			OLED_SetCursor(&oledDevice, 0, 3);
			OLED_PutString(&oledDevice, "Calorie = ");
			// Affichage de la Calorie sur le Pmod OLED
			sprintf(dataChar,"%2.2f",currentData);
			OLED_SetCursor(&oledDevice, 10, 3);
			OLED_PutString(&oledDevice, dataChar);
			OLED_Update(&oledDevice);
		}
		else {
			OLED_ClearBuffer(&oledDevice);
			currentData = Speed_GetSampleValue();
			OLED_SetCursor(&oledDevice, 0, 1);
			OLED_PutString(&oledDevice, "Vitesse = ");
			// Affichage de la vitesse sur le Pmod OLED
			sprintf(dataChar,"%2.2f",currentData);
			OLED_SetCursor(&oledDevice, 10, 1);
			OLED_PutString(&oledDevice, dataChar);

			OLED_SetCursor(&oledDevice, 0, 3);
			OLED_PutString(&oledDevice, "Voltage = ");
			// Affichage de la Calorie sur le Pmod OLED
			sprintf(dataChar,"%2.2f",currentVoltage);
			OLED_SetCursor(&oledDevice, 10, 3);
			OLED_PutString(&oledDevice, dataChar);
			OLED_Update(&oledDevice);


		}

		// Affichage graduel du voltage sur le Pmod 8LD
		// 3.3V => tous les leds allum�s
		// 0.0V => tous les leds �teints
		pmod8LDvalue = 0xFF << (8 - (u8)(currentVoltage / ReferenceVoltage * 8));
		GPIO_setPins(&pmod8LD,pmod8LDvalue);
	}

    return 0;
}


u16 AD1_GetSampleRaw()
{
	u16 rawData =  MYIP_mReadReg(MY_AD1_IP_BASEADDRESS, 0x0) & 0xFFF;
	return rawData;
}

float AD1_GetSampleVoltage()
{
	float conversionFactor = ReferenceVoltage / ((1 << AD1_NUM_BITS) - 1);

	u16 rawSample = AD1_GetSampleRaw();

	return (float)rawSample * conversionFactor;

}

u16 Speed_GetSampleRaw()
{
	u16 rawData =  MYIP_mReadReg(MY_VITESSE_IP_BASEADDRESS, 0x0) & 0xFFF;
	return rawData;
}


float Speed_GetSampleValue()
{
	u16 rawSample = Speed_GetSampleRaw();

	return (float)rawSample;

}

u16 Distance_GetSampleRaw()
{
	u16 rawData =  MYIP_mReadReg(MY_DISTANCE_IP_BASEADDRESS, 0x0) & 0xFFF;
	return rawData;
}


float Distance_GetSampleValue()
{
	u16 rawSample = Distance_GetSampleRaw();

	return (float)rawSample;

}

u16 Calorie_GetSampleRaw()
{
	u16 rawData =  MYIP_mReadReg(MY_CALORIE_IP_BASEADDRESS, 0x0) & 0xFFF;
	return rawData;
}


float Calorie_GetSampleValue()
{
	u16 rawSample = Calorie_GetSampleRaw();

	return (float)rawSample;

}


