all: build/firmware.elf

build/main.o: main.s
	@mkdir -p build
	arm-none-eabi-as -g -mcpu=cortex-m4 -mthumb -o build/main.o main.s

build/firmware.elf: linker.ld build/main.o
	arm-none-eabi-ld -T linker.ld -o build/firmware.elf build/main.o

flash: build/firmware.elf
	openocd -f interface/stlink.cfg -f target/stm32f4x.cfg -c "program build/firmware.elf verify reset exit"
