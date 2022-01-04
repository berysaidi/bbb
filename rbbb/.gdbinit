target extended-remote :3335
load target/armv7a-none-eabi/debug/rbbb
file target/armv7a-none-eabi/debug/rbbb
b start
b main
set $pc = 0x402f0400
set $sp = 0x402F1000
# c
layout asm
layout regs
