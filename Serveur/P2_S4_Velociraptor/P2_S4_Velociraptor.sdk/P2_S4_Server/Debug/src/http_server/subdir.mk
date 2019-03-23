################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/http_server/http_response.c \
../src/http_server/platform_fs.c \
../src/http_server/platform_gpio.c \
../src/http_server/web_utils.c \
../src/http_server/webserver.c 

OBJS += \
./src/http_server/http_response.o \
./src/http_server/platform_fs.o \
./src/http_server/platform_gpio.o \
./src/http_server/web_utils.o \
./src/http_server/webserver.o 

C_DEPS += \
./src/http_server/http_response.d \
./src/http_server/platform_fs.d \
./src/http_server/platform_gpio.d \
./src/http_server/web_utils.d \
./src/http_server/webserver.d 


# Each subdirectory must supply rules for building sources it contributes
src/http_server/%.o: ../src/http_server/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -I../../P2_S4_Server_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


