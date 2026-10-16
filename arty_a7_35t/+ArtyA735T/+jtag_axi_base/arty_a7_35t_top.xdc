## Digilent Arty A7-35T - board clock and reset (from Arty-A7-35-Master.xdc)

## 100 MHz oscillator
set_property -dict { PACKAGE_PIN E3  IOSTANDARD LVCMOS33 } [get_ports { clk }];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { clk }];

## ck_rst : red RESET push button, active low
set_property -dict { PACKAGE_PIN C2  IOSTANDARD LVCMOS33 } [get_ports { reset }];

## bitstream settings
set_property CFGBVS VCCO        [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
