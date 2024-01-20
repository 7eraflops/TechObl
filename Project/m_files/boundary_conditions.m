function bc = boundary_conditions(bc_choice)
%  BOUNDARY_CONDITIONS Boundary conditions
    bc = @boundary_conditions_inner;
    function [pl,ql,pr,qr] = boundary_conditions_inner(xl,ul,xr,ur,t)
        if(bc_choice(1) == 0)
            pl = 0;
            ql = 1;
        else
            pl = ul - bc_choice(2);
            ql = 0;
        end
        if(bc_choice(3) == 0)
            pr = 0;
            qr = 1;
        else
            pr = ur - bc_choice(4);
            qr = 0;
        end
    end
end