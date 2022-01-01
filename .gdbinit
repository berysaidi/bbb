target extended-remote :3335
load main.elf
file main.elf
b start
b main
set $pc = 0x402F0400
set $sp = 0x402F0F00
c
layout asm
layout regs
