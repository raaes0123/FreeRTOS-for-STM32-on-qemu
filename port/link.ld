ENTRY(reset_handler)

MEMORY {
  FLASH (rx)  : ORIGIN = 0x08000000, LENGTH = 128K
  SRAM  (rwx) : ORIGIN = 0x20000000, LENGTH = 8K
}

SECTIONS {
  .text : {
    . = ALIGN(4);
    *(.vectors)
    *(.text*)
    *(.rodata*)
    . = ALIGN(4);
    _sidata = .;                          /* Start of .data init values in Flash */
  } > FLASH

  .data : AT (ADDR(.text) + SIZEOF(.text)) {
    . = ALIGN(4);
    _sdata = .;                           /* Start of .data values in SRAM */
    *(.data*)
    . = ALIGN(4);
    _edata = .;                           /* End of .data values in SRAM */
  } > SRAM

  .bss : {
    . = ALIGN(4);
    _sbss = .;                           /* Start of .bss in SRAM */
    *(.bss*)
    *(COMMON)
    . = ALIGN(4);
    _ebss = .;                           /* End of .bss in SRAM */
  } > SRAM

  .stack (NOLOAD) : {   /* The NOLOAD attribute tells the loader not to initialize this region — the memory is reserved at runtime, not in the binary. */
    . = ALIGN(4);
    _stack_bottom = .;  /* Current position is the stack bottom*/
    . = . + 0x800;     /* Move to 0x800 over Set Stack size =  2KB So total SRAM size <= 8KB*/
    . = ALIGN(4);
    _stack_top = .;     /* Mark that position as the stack top*/
  } > SRAM
}
