setup:
  - tin can tools flyswatter2
  - beaglebone black with 20 jtag header installed
  - gcc 11+

instructions:
```
git clone subomodule init
cd openocd
./configure --enable-maintainer-mode --enable-ft2232_libftdi
make -j
make install #requires su priv
openocd -f bbb-fs.cfg

Open On-Chip Debugger 0.11.0+dev-00550-gd27d66bc1 (2021-12-31-03:37)
Licensed under GNU GPL v2
For bug reports, read
http://openocd.org/doc/doxygen/bugs.html
Info : auto-selecting first available session transport "jtag". To override use 'transport select <transport>'.
Info : clock speed 1000 kHz
Info : JTAG tap: am335x.jrc tap/device found: 0x2b94402f (mfg: 0x017 (Texas Instruments), part: 0xb944, ver: 0x2)
Info : JTAG tap: am335x.tap enabled
Info : am335x.cpu: hardware has 6 breakpoints, 2 watchpoints
Info : am335x.cpu rev 2, partnum c08, arch f, variant 3, implementor 41
Error: MPIDR not in multiprocessor format
Info : starting gdb server for am335x.m3 on 3334
Info : Listening on port 3334 for gdb connections
Info : starting gdb server for am335x.cpu on 3335
Info : Listening on port 3335 for gdb connections
Info : Listening on port 6667 for tcl connections
Info : Listening on port 4445 for telnet connections

arm-none-eabi-gdb 

Info : accepting 'gdb' connection on tcp/3335
Info : New GDB Connection: 1, Target am335x.cpu, state: halted
Info : am335x.cpu rev 2, partnum c08, arch f, variant 3, implementor 41
```
continue and look at them leds blinking x)
