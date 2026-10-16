function r = hdlcoder_board_customization
% Board plugin registration file
%   HDL Coder scans the MATLAB path for files with this name.
%   Add this folder to the path (addpath) and the board appears in the
%   HDL Workflow Advisor "Target platform" list.

r = { ...
    'ArtyA735T.plugin_board', ...
    };
end
