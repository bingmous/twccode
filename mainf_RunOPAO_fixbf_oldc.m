function [data_o_ij_r, data_a_j_r, data_b_i] = mainf_RunOPAO_fixbf_oldc()
% alternative optimization

% -----------start-----------------------
mainf_Initialize();
[data_b_i] =mainf_Initialize_op_AO_fixbf_old(); 
[data_o_ij_r, data_a_j_r] = mainf_SDR_op_AO1_fixbf_oldc();
% [data_o_ij_r, data_a_j_r, data_b_i] = mainf_SDR_op1_fixbfc();

end




  