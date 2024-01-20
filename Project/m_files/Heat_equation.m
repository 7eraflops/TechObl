%% *The heat equation*
%% 1. Introduction
%% 
% # Let's assume a 1-dimensional rod with length $L>0$ made of an isotropic 
% material,
% # The function $T(x,t)$ describes the heat of a point $x$ at time $t$, $x 
% \in [ 0,L ]$, $t \in [0,\infty)$,
% # At $t=0$, the rod has some initial heat distribution $T(x,0) = \phi(x)$,
% # We assume no heat exchange with the enviornment.
%% 
% Knowing that, is there a way to know how the heat distribution in the object 
% changes over time? 
%% 2. Joseph Fourier's study of heat flow
% _The Analytical Theory of Heat_ (fr. _Théorie analytique de la chaleur_) is 
% Fourier's 1822 publication on heat flow. His work was based on Isaac Newton's 
% law of cooling, which states:
% 
% _*"The rate of heat loss of a body is directly proportional to the difference 
% in the temperatures between the body and its environment."*_
% 
% It is in this book where he famously stated, that any function can be expressed 
% as an infinite sum of sine waves, which led to the invention of the fourier 
% series and later, the fourier transform.
% The heat equation for 3 dimensions:
% $$\frac{\partial T}{\partial t} = \alpha \cdot \left( \frac{\partial^2 T}{\partial 
% x^2}+\frac{\partial^2 T}{\partial y^2}+\frac{\partial^2 T}{\partial z^2} \right)$$
% 
% which can also be generalized as:
% 
% $\frac{\partial T}{\partial t} = \alpha \cdot \nabla^2 T$ , where $\nabla^2$ 
% is the laplacian operator
%% 3. Methods used in my solution
% To solve the partial differential equation involved in this problem, I used 
% the _pdepe_ solver from the PDE toolbox, which can solve 1-D parabolic and elliptic 
% PDEs. 
%%
% 
%   sol = pdepe(m,pdefun,icfun,bcfun,xmesh,tspan)
%
%% 
% The term m is used to set either cylindrical (m=1) or spherical (m=2) symmetry. 
% In my case it was 0 for no symmetry and only one spatial dimension x.
% 
% 
% 
% pdefun is a vector containg everything needed to define the PDE itself, in 
% my case it's the output of the function heatpde, and the solver expects a PDE 
% given in this form:
% 
% $$c\left(x,t,u,\frac{\partial u}{\partial x}\right)\frac{\partial u}{\partial 
% x}=x^{-m} \frac{\partial u}{\partial x}\left(x^m f\left(x,t,u,\frac{\partial 
% u}{\partial x}\right)\right)+s\left(x,t,u,\frac{\partial u}{\partial x}\right)\ldotp$$
% 
% c is the constant that scales the time derivative, 
% 
% f is the function that we take the derivative of (we need the 2nd derivative 
% so x is set as dfdx)
% 
% s is any sources, which in this case is 0
% 
% 
% 
% icfun is the vector defining the initial conditions, here returned by the 
% function initial_conditions, which takes in all the parameters for the different 
% ICs available.
% 
% 
% 
% bcfun is the vector defining the boundary conditions, here returned by the 
% function boundar_conditions. The solver expects them in this form:
% 
% $$p\left(x,t,u\right)+q\left(x,t\right)f\left(x,t,u,\frac{\partial u}{\partial 
% x}\right)=0\ldotp$$
% 
% it allows setting Dirichlet (Constant temperature at boundary), Neumann(constant 
% heat flux at boundary) or mixed boundary conditions. In this program I only 
% included the first two.
% 
% 
% 
% xmesh and tspan are vectors containing the values of x along the rod, and 
% the points in time for the simulation to run respectively.  
% 
% 
% 
% After calculating everything I use figure functions such as set and drawnow 
% to create an animated graph of the solution changing over time
% 
% 
% 
% As for the 2-D case, I also used the PDE toolbox to first create a transient 
% thermal model using createpde, then I create a geometry consisting of 2 separate 
% geometries: a flat square plate and a circle in it's center which is the area 
% that starts at a highier temperature, and use decsg to decompose the geometry 
% matrix gd to the simplest form that satisfiers the condition sf. Ater that, 
% I assign the thermal model the geometry using geometryfromedges. I set all thermal 
% parameters to 1 for simplicity, set a 0 heat flux boundary condition on all 
% edges, and an initial condition for the 2 regions, the inner being 10K and the 
% outer 0. Then I use generateMesh on the model to create the points required 
% for the FEM analysis. The last step is using the solve function on the model 
% with a given vector of time values and graphing all the temperature values and 
% how they change with time on the animated graph.
%% 4. Heat flow in a 1-dimensional rod
% Let's first look at a simplified example with a 1-dimensional rod insulated 
% at both ends (No heat lost to the enviornment) and with an initial heat distribution 
% $\phi (x)$
% Simulation parameters

rod_length = 10;
runtime = 10;
length_resolution = 20;
time_resolution = 20;
position = linspace(0,rod_length,rod_length*length_resolution + 1);
time = linspace(0,runtime,runtime*time_resolution + 1);
% Boundary conditions

left_end_state = 0;
right_end_state = 0;
%% 
% if you chose a constant temperature for any end, set it here

left_end_constant_temperature = 0;
right_end_constant_temperature = 0;
bc_choice = [left_end_state, left_end_constant_temperature, right_end_state, right_end_constant_temperature];
bcs = boundary_conditions(bc_choice);
% Temperature distribution selection 

ic_choice = 4;
% Controls for two peaks

first_peak_middle = 1;
second_peak_middle = 9;
first_peak_value = 50;
second_peak_value = 50;
first_peak_thickness = 0.001;
second_peak_thickness = 0.001;
% Controls for sin

frequency =2;
amplitude = 10;
% Controls for constant value

constant_temperature = 0;
% Controls for discontinuous

left_side_temperature = 0;
right_side_temperature = 1000;
discontinuity_point = 5;
% Slice selection

x_step = rod_length/(rod_length*length_resolution);
slice_x_value = 5;
slice_x_value_index = find(position == slice_x_value,1);
 
params = { ...
    first_peak_middle...
    second_peak_middle...
    first_peak_value...
    second_peak_value...
    first_peak_thickness...
    second_peak_thickness...
    frequency...
    amplitude...
    constant_temperature...
    left_side_temperature...
    right_side_temperature...
    discontinuity_point
    };
phi = initial_conditions(ic_choice, params);
sol_1D = pdepe(0,@heatpde,phi,bcs,position,time);
%% 5. Result

 
figure('name','Heat_flow_simulation','Position',[100 100 1400 1000])
colorPropObjs = findobj(gcf, "-property", "Color");
colorPropObjs(1).Color = [0.1490 0.1490 0.1490];
y_axis_max_value = 1.1 * max(phi(position));
tiledlayout(2,2)
nexttile
    plot(position, phi(position));
    xlim([0 rod_length])
    ylim([0 y_axis_max_value])
    grid on
    title("Initial temperature distribution \phi(x)")
    xlabel("position [m]")
    ylabel("Temperature [K]")
    colormap('jet')
nexttile
    p_1 = plot(position,sol_1D(1,:));
    hold on
    grid on
    xlim([0 rod_length])
    ylim([0 y_axis_max_value])
    t_1 = title("Temperature distribution for t =");
    xlabel("position [m]")
    ylabel("temperature [K]")
nexttile
    p_2 = animatedline('Color',[0 0.4470 0.7410]);
    addpoints(p_2,time(1),sol_1D(1,slice_x_value_index))
    hold on
    grid on
    xlim([0 runtime])
    ylim([0 y_axis_max_value])
    t_2 = title(strcat("Temperature at position = ", num2str(slice_x_value), " m over time"));
    xlabel("time [s]")
    ylabel("temperature [K]")
nexttile
    temp = NaN(length(time),length(position));
    temp(1,:) = sol_1D(1,:);
    p_3 = surf(position,time,temp,'EdgeColor','interp');
    grid on
    axis ([0 rod_length 0 runtime 0 y_axis_max_value])
    title("Temperature along the rod over time")
    xlabel("position [m]")
    ylabel("time [s]")
    zlabel("temperature [K]")
    colormap("jet")
    colorbar
    for k = 2:length(time)
        temp(k,:) = sol_1D(k,:);
        set(p_1,'XData',position,'YData',sol_1D(k,:))
        set(t_1,'String',strcat("Temperature distribution for t = ", num2str(time(k))," s"))
        addpoints(p_2,time(k),sol_1D(k,slice_x_value_index))
        set(p_3,'XData',position,'YData',time,'ZData',temp)
        drawnow
    end
%% 6. Heat flow in a 2-dimensional plate

thermalmodel = createpde("thermal","transient");
R1 = [3;4;-1;1;1;-1;-1;-1;1;1];
C1 = [1;0;0;0.4];
C1 = [C1;zeros(length(R1) - length(C1),1)];
gd = [R1,C1];
sf = 'R1+C1';
ns = char('R1','C1')';
g = decsg(gd,sf,ns);
geometryFromEdges(thermalmodel,g);
thermalProperties(thermalmodel,"ThermalConductivity",1,...
                               "MassDensity",1,...
                               "SpecificHeat",1);


figure('Position',[100 100 1000 400])
colorPropObjs = findobj(gcf, "-property", "Color");
colorPropObjs(1).Color = [0.1490 0.1490 0.1490];
tiledlayout('flow')

nexttile
pdegplot(thermalmodel,"EdgeLabels","on","FaceLabels","on")
axis([-1.1 1.1 -1.1 1.1]);
title("Geometry With Edge and Subdomain Labels")
thermalBC(thermalmodel,"Edge",1:4,"HeatFlux",0);
thermalIC(thermalmodel,0);
thermalIC(thermalmodel,10,"Face",2);

nexttile
msh = generateMesh(thermalmodel,'Hmax',0.05);
pdemesh(thermalmodel); 
title("Geometry With Mesh")

axis([-1.1 1.1 -1.1 1.1]);
nframes = 200;
tlist = linspace(0,0.1,nframes);
result = solve(thermalmodel,tlist);
T = result.Temperature;

figure('Position',[100 100 1200 1000])
colorPropObjs = findobj(gcf, "-property", "Color");
colorPropObjs(1).Color = [0.1490 0.1490 0.1490];
Tmax = max(max(T));
Tmin = min(min(T));
for j = 1:nframes
    pdeplot(thermalmodel,"XYData",T(:,j),"ZData",T(:,j),'ColorMap','Jet');
    axis([-1 1 -1 1 0 10]);
    title("Heat distribution over time")
    drawnow
end