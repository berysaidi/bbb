MEMORY
{
    sram : ORIGIN = 0x402F0400, LENGTH = 64K
}

STACK_SIZE = 0x1000;
ENTRY(start)
SECTIONS
{
    .text : { 
	    KEEP(*(.start))
	    *(.text*) 
    } > sram
    .bss : { *(.bss*) } > sram
    .data : { *(.data*) } > sram
    .stack : {
    . = ALIGN(8);
    . = . + STACK_SIZE;
    . = ALIGN(8);
    } > sram
    _end = . ;
}
