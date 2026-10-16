function hRD = plugin_rd()
% Reference design definition: Arty A7-35T, no processor,
% MATLAB as AXI manager over the on-board USB-JTAG cable.
%
%   system_top.tcl      : block design exported from Vivado
%                         (File > Export > Export Block Design)
%   arty_a7_35t_top.xdc : board clock + reset pins

hRD = hdlcoder.ReferenceDesign('SynthesisTool', 'Xilinx Vivado');

hRD.ReferenceDesignName = 'JTAG AXI Manager system';
hRD.BoardName           = 'Digilent Arty A7-35T (custom)';

% Vivado version(s) this block design was exported from
hRD.SupportedToolVersion = {'2024.1'};

%% Vivado design files
hRD.addCustomVivadoDesign('CustomBlockDesignTcl', 'system_top.tcl');
hRD.CustomConstraints = {'arty_a7_35t_top.xdc'};

% the block design uses the HDL Verifier JTAG AXI Manager IP
hRD.addIPRepository( ...
    'IPListFunction',  'hdlverifier.fpga.vivado.iplist', ...
    'NotExistMessage', 'Install the HDL Verifier Support Package for AMD FPGA and SoC Devices.');

%% Interfaces
% DUT clock/reset come from the Clocking Wizard / Processor System Reset
hRD.addClockInterface( ...
    'ClockConnection',     'clk_wiz_0/clk_out1', ...
    'ResetConnection',     'proc_sys_reset_0/peripheral_aresetn', ...
    'DefaultFrequencyMHz', 50, ...
    'MinFrequencyMHz',     10, ...
    'MaxFrequencyMHz',     150, ...
    'ClockModuleInstance', 'clk_wiz_0', ...
    'ClockNumber',         1);

% DUT registers hang off the free AXI Interconnect port, mastered by MATLAB
hRD.addAXI4SlaveInterface( ...
    'InterfaceConnection', 'axi_interconnect_0/M00_AXI', ...
    'BaseAddress',         '0x40000000', ...
    'MasterAddressSpace',  'hdlverifier_axi_manager_0/axi4m', ...
    'InterfaceType',       'AXI4-Lite');

% no Arm/MicroBlaze: skip the software interface task, program over JTAG
hRD.HasProcessingSystem          = false;
hRD.SupportedProgrammingMethods  = hdlcoder.ProgrammingMethod.JTAG;
end
