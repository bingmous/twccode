function [o_ij_r, a_j_r, b_i] = mainf_RunOP12c()
    [o_ij_r, a_j_r] = mainf_SDR_op1c();
    [b_i] = mainf_SDR_op2(o_ij_r);
end


