## Getting started

This repository contains minimum setup to run FreeRTOS on a Cortex M3 microcontroller
on a qemu emulated stm32vldiscovery board based on VSCode.
It uses gcc-arm-none-eabi toolchain for assembling, compiling and linking code and
qemu to emulate the stm32vldiscovery board.

# Starting the Qemu Emulator
Inside the port directory run <br>
<pre> ```bash make qemu``` </pre>

# Starting the debugger
Inside the port directory in a new terminal run <br>
<pre> ```bash make gdb``` </pre>