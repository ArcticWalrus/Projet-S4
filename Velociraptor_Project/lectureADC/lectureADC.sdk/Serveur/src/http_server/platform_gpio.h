/*
 * Copyright (c) 2009 Xilinx, Inc.  All rights reserved.
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 *
 */

#ifndef __PLATFORM_GPIO_H_
#define __PLATFORM_GPIO_H_

#include <stdio.h>

typedef uint16_t u16;

#define MY_AD1_IP_BASEADDRESS  XPAR_MYIP_0_S00_AXI_BASEADDR

#define MY_VITESSE_IP_BASEADDRESS  XPAR_MYIO_IP_0_S00_AXI_BASEADDR
#define MY_DISTANCE_IP_BASEADDRESS  XPAR_MYIO_IP_1_S00_AXI_BASEADDR
#define MY_CALORIE_IP_BASEADDRESS  XPAR_MYIO_IP_2_S00_AXI_BASEADDR
#define MY_DEPORTATION_IP_BASEADDRESS  XPAR_MYIO_IP_3_S00_AXI_BASEADDR
#define MY_POIDS_IP_BASEADDRESS  XPAR_MYIO_IP_4_S00_AXI_BASEADDR

#define AD1_NUM_BITS 	12

void platform_init_gpios();
int toggle_leds();
unsigned int get_switch_state();

u16 AD1_GetSampleRaw();
float AD1_GetSampleVoltage();
u16 Speed_GetSampleRaw();
float Speed_GetSampleValue();
u16 Distance_GetSampleRaw();
float Distance_GetSampleValue();
u16 Calorie_GetSampleRaw();
float Calorie_GetSampleValue();
u16 Deportation_GetSampleRaw();
float Deportation_GetSampleValue();

void Poids_WriteValue(unsigned int poids);

#endif
