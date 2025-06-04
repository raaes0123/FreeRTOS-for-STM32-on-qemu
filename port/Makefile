
PROJECT=startup
CPU ?= cortex-m3
BOARD ?= stm32vldiscovery
FREERTOS_PATH = ../FreeRTOS-Kernel
ARM_CM3 = ../FreeRTOS-Kernel/portable/GCC/ARM_CM3

INC= -I $(FREERTOS_PATH)/include \
		-I ./ \
		-I $(ARM_CM3)
qemu:
	arm-none-eabi-gcc -mcpu=$(CPU) -mthumb -ggdb -c startup.s -o startup.o $(INC)
	arm-none-eabi-gcc -mcpu=$(CPU) -mthumb -ggdb -c c_startup.c -o c_startup.o $(INC)
	arm-none-eabi-gcc -mcpu=$(CPU) -mthumb -ggdb -c main.c -o main.o $(INC)
	arm-none-eabi-gcc -mcpu=$(CPU) -mthumb -ggdb -c $(FREERTOS_PATH)/tasks.c -o tasks.o $(INC)
	arm-none-eabi-gcc -mcpu=$(CPU) -mthumb -ggdb -c $(FREERTOS_PATH)/list.c -o list.o $(INC)
	arm-none-eabi-gcc -mcpu=$(CPU) -mthumb -ggdb -c $(FREERTOS_PATH)/queue.c -o queue.o $(INC)
	arm-none-eabi-gcc -mcpu=$(CPU) -mthumb -ggdb -c $(FREERTOS_PATH)/timers.c -o timers.o $(INC)
	arm-none-eabi-gcc -mcpu=$(CPU) -mthumb -ggdb -c $(ARM_CM3)/port.c -o port.o $(INC)
	arm-none-eabi-gcc -mcpu=$(CPU) -mthumb -ggdb -c $(FREERTOS_PATH)/portable/MemMang/heap_4.c -o heap_4.o $(INC)
	arm-none-eabi-ld -T link.ld startup.o c_startup.o main.o tasks.o list.o queue.o timers.o port.o heap_4.o -o main.elf -Map=main.map
	qemu-system-arm -M $(BOARD) -cpu $(CPU) -nographic -kernel main.elf -S -gdb tcp::1234

gdb:
	gdb-multiarch -q main.elf -ex "target remote localhost:1234"

clean:
	rm -rf *.out *.elf .gdb_history *.lst *.debug *.o
