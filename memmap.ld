MEMORY
{
    sram : ORIGIN = 0x402F0400, LENGTH = 64K
}

STACK_SIZE = 0x200;
ENTRY(start)
SECTIONS
{
    .text : { *(.text*) } > sram
    .bss : { *(.bss*) } > sram
    .data : { *(.data*) } > sram
    .stack : {
    . = ALIGN(8);
    . = . + STACK_SIZE;
    . = ALIGN(8);
    } > sram
    _end = . ;
}
