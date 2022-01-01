MEMORY
{
    gprc : ORIGIN = 0x0, LENGTH = 0x1B400
    sram: ORIGIN = 0x402F0400, LENGTH = 64K
}

SECTIONS
{
    .text : { *(.text*) } > sram
    .bss : { *(.bss*) } > sram
    .data : { *(.data*) } > sram

}
