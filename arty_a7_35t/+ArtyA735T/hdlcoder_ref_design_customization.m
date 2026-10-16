function [rd, boardName] = hdlcoder_ref_design_customization
% Reference design plugin registration file
%   A file with this name inside the board package folder is picked up
%   automatically. It lists the reference designs available for the board.

rd = { ...
    'ArtyA735T.jtag_axi_base.plugin_rd', ...
    };

boardName = 'Digilent Arty A7-35T (custom)';
end
