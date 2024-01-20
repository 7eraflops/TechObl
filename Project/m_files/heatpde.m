function [c,f,s] = heatpde(x,t,u,dudx)
%  HEATPDE defining the PDE
    c = 1;
    f = dudx;
    s = 0;
end