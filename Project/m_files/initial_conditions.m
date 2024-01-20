function phi = initial_conditions(ic_choice, params)
%  INITIAL_CONDITIONS Brief summary of this function.
% 
% Detailed explanation of this function.
    first_peak_middle = params{1};
    second_peak_middle = params{2};
    first_peak_value = params{3};
    second_peak_value = params{4};
    first_peak_thickness = params{5};
    second_peak_thickness = params{6};
    frequency = params{7};
    amplitude = params{8};
    constant_temperature = params{9};
    left_side_temperature = params{10}; 
    right_side_temperature = params{11};
    discontinuity_point = params{12};
    initial_condition_list = { ...
        @(x) first_peak_value*exp(-((x-first_peak_middle).^2)/first_peak_thickness)+second_peak_value*exp(-((x-second_peak_middle).^2)/second_peak_thickness) ...
        @(x) amplitude*sin(frequency*x)+amplitude ...
        @(x) 0*x + constant_temperature ...
        @(x) (0*x + left_side_temperature).*(x < discontinuity_point) + (0*x + right_side_temperature).*(x >= discontinuity_point)
        };
    phi = initial_condition_list{ic_choice};
end