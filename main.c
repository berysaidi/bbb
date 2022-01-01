#define GPIO1_BASE		0x4804C000
#define GPIO_SYSCONFIG		0x10
#define GPIO_SYSSTATUS		0x114
#define GPIO_OE			0x134
#define GPIO_CLRDATAOUT		0x190
#define GPIO_SETDATAOUT		0x194
#define CM_PER_BASE		0x44e00000
#define CM_PER_GPIO1		0xAC
#define TIME (2*50000)

static volatile int counter = 5;
void main (void)
{
	volatile unsigned int ra;
		//PUT32(CM_PER_BASE+CM_PER_GPIO1, 1<<18 | 2);
		*(volatile unsigned int *)(CM_PER_BASE+CM_PER_GPIO1) = 1<<18 | 2;
		ra = *(volatile unsigned int*)(GPIO1_BASE+GPIO_OE);
		ra &= ~(15<<21);
		*(volatile unsigned int *)(GPIO1_BASE+GPIO_OE) = ra;
	for(;;)
	{
		counter++;
		*(volatile unsigned int *)(GPIO1_BASE+GPIO_SETDATAOUT) = 15<<21;
		for(ra = 0; ra < TIME; ra ++);
		*(volatile unsigned int *)(GPIO1_BASE+GPIO_CLRDATAOUT) = 15<<21;
		for(ra = 0; ra < TIME; ra ++);
	}
   return;
}

