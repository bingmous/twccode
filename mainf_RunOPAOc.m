function [data_o_ij_r, data_a_j_r, data_b_i] = mainf_RunOPAOc()
% alternative optimization

% -----------start-----------------------
mainf_Initialize();% if the parameters.m is modified, it changes also
[o_ij_r, a_j_r, b_i] = mainf_RunOP12c(); % the first solution
% [CT, C, T] = mainf_cost_CT(o_ij_r, b_i);
[CT, ~, ~] = mainf_cost_CT(o_ij_r, b_i);
data_CT= CT; % save the optimal decision and cost
% data_C = C;
% data_T = T;
data_a_j_r = a_j_r;
data_o_ij_r = o_ij_r;
data_b_i = b_i;
b_io = b_i;
flag = 1;
% step = 2;
% data_CT_save = zeros(20, 3); % save 50 times change of lower cost
% data_CT_save(1, 1) = CT;
% data_CT_save(1, 2) = C;
% data_CT_save(1, 3) = T;
% while flag == 1 && step <=19
while flag == 1
    mainf_Initialize_op_AO(b_io); % for the op1_AO initialization --SDR
    [o_ij_ro, a_j_ro] = mainf_SDR_op_AO1c();
    [b_io] = mainf_SDR_op_AO2(o_ij_ro);
%     [CTo, Co, To] = mainf_cost_CT(o_ij_ro, b_io);
    [CTo, ~, ~] = mainf_cost_CT(o_ij_ro, b_io);
    if CTo >= data_CT
        flag = 0;
    else
        data_CT = CTo;
%         data_C = Co;
%         data_T = To;
        data_a_j_r = a_j_ro;
        data_o_ij_r = o_ij_ro;
        data_b_i = b_io;
%         data_CT_save(step, 1) = CTo;
%         data_CT_save(step, 2) = Co;
%         data_CT_save(step, 3) = To;
%         step = step + 1;
    end
    
end

% save ./data/data_main_SDR_op_AOc data_a_j_r data_o_ij_r data_b_i data_CT_save


end







  