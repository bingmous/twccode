clear,clc
load ./R100/data8_beta_i_1015
ctdt = ctd
load ./R100/data8_beta_i
ctd
ctd = [ctdt;ctd]
save ./R100/data8_beta_i_add1015