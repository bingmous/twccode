function [data_o_ij_r, data_a_j_r, data_b_i] = mainf_RunOPAO_fixbf()
% alternative optimization

% -----------start-----------------------
mainf_Initialize();
[data_o_ij_r, data_a_j_r, data_b_i] = mainf_SDR_op1_fixbf();

end




  