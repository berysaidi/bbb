CHAIN=arm-none-eabi


all: start.s main.c
	arm-none-eabi-as start.s -o start.o
	arm-none-eabi-gcc -O0 -ggdb -c main.c -o main.o
	arm-none-eabi-ld start.o main.o -T memmap.ld -o main.elf
	arm-none-eabi-objcopy main.elf main.bin -O binary
debug:
	arm-none-eabi-gdb
clean:
	rm -rf *.o
	rm -rf *.elf
	rm -rf *.bin
