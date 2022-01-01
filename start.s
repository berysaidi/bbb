.equ CM_PER_GPIO1_CLKCTRL, 0x44e000AC
.equ GPIO1_OE, 0x4804C134
.equ GPIO1_SETDATAOUT, 0x4804C194

start:
	mrs r0, cpsr
	bic r0, r0, #0x1F @ clear mode bits
	orr r0, r0, #0x13 @ set SVC mode
	orr r0, r0, #0xC0 @ disable FIQ and IRQ
	msr cpsr, r0

	@sub sp,sp,#0x1800	@6kB public stack

	bl main

.loop: b .loop
