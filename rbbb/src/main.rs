#![no_std]
#![no_main]

use core::arch::asm;
use core::panic::PanicInfo;
use core::ptr::{read_volatile, write_volatile};


#[panic_handler]
fn panic(_panic: &PanicInfo<'_>) -> ! {
    loop{}
}


#[link_section = ".start"]
#[no_mangle]
pub unsafe extern "C" fn start() -> ! {
        asm!(
        "mrs r0, cpsr",
	    "bic r0, r0, #0x1F", //@ clear mode bits
	    "orr r0, r0, #0x13", //@ set SVC mode
	    "orr r0, r0, #0xC0", //@ disable FIQ and IRQ
	    "msr cpsr, r0",
	    "@sub sp,sp,#0x1800", //@6kB public stack
	    "bl main",
        );
    loop {
        // your code goes here
    }
}


const GPIO1_BASE: u32 =           0x4804C000;
const GPIO_SYSCONFIG: u32 = 		0x10;
const GPIO_SYSSTATUS: u32 = 		0x114;
const GPIO_OE: u32 = 			    0x134;
const GPIO_CLRDATAOUT: u32 = 		0x190;
const GPIO_SETDATAOUT: u32 = 		0x194;
const CM_PER_BASE: u32 = 		    0x44e00000;
const CM_PER_GPIO1: u32 = 		0xAC;
const TIME: u32 = 1000;


const A: *mut u32 = (0x40021000 + 0x018) as *mut u32;
#[no_mangle]
pub unsafe fn main() -> ! {
    write_volatile((CM_PER_BASE+CM_PER_GPIO1) as *mut u32, 1<<18|2);    
    let mut ra = read_volatile((CM_PER_BASE+GPIO_OE) as *mut u32);
    ra &= !(15<<21);
    write_volatile((GPIO1_BASE+GPIO_OE) as *mut u32, ra);

    let mut _i = 0;
    loop {
    _i+=1;
    write_volatile((GPIO1_BASE+GPIO_SETDATAOUT) as *mut u32, 15<<21);
    for n in 0..TIME {};
    write_volatile((GPIO1_BASE+GPIO_CLRDATAOUT) as *mut u32, 15<<21);
    for n in 0..TIME {};
    }

}
