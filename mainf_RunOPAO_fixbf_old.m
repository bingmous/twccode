function [data_o_ij_r, data_a_j_r, data_b_i] = mainf_RunOPAO_fixbf_old()
% alternative optimization

% -----------start-----------------------
mainf_Initialize();% if the parameters.m is modified, it changes also
% use the first step in AO
[data_b_i] =mainf_Initialize_op_AO_fixbf_old(); 
[data_o_ij_r, data_a_j_r] = mainf_SDR_op_AO1_fixbf_old(); %It's the same with mainf_SDR_op_AO1

end







  