.section .vectors
vector_table:
    .word _stack_top        // Stack Pointer             0
    .word reset_handler     // Reset Handler             1
    .word NMI_Handler       //* NMI Handler */           2
    .word HardFault_Handler //* Hard Fault Handler */    3
    .word 0                 //* Reserved */              4
    .word 0                 //* Reserved */              5
    .word 0                 //* Reserved */              6
    .word 0                 //* Reserved */              7
    .word 0                 //* Reserved */              8
    .word 0                 //* Reserved */              9
    .word 0                 //* Reserved */              A
    .word vPortSVCHandler   //* SVCall Handler */        B
    .word 0                 //* Reserved */              C
    .word 0                 //* Reserved */              D
    .word xPortPendSVHandler    //* PendSV Handler */    E
    .word xPortSysTickHandler   //* SysTick Handler */   F

.section .text
.global reset_handler
.align 1
.type reset_handler, %function
reset_handler:
    b c_startup

.section .text
.global NMI_Handler
.align 1
.type NMI_Handler, %function
NMI_Handler:
    b .

.section .text
.global HardFault_Handler
.align 1
.type HardFault_Handler, %function
HardFault_Handler:
    b .