%singularity_functions
%Syntax
%[n_y,y] = singularity_functions(lim1,lim2,N,Subscript)
%Description
%lim1 and lim2 is defined as the whole time interval
% for 1/N is the unit time interval, N is defined as the accuracy
%Subscript should be integer, if Subscript is 0. Then the function can
%generate a unit impluse signal.
%n_y is the coordinates of the output
%y is the value of the output
%

function [n_y,y]=singularity_functions(lim1,lim2,N,Subscript)

%% check the value of Subscript
if isreal(Subscript) && rem(Subscript,1)==0
else
    msg="Error in singularity_function,check the input!!";
    error(msg);
end

%% Generate a impulse signal
[n_x,x]=unit_step_signal(lim1,lim2,N,0,0);
[n_z_to_process,z_to_process]=derivative_withcoordinates(n_x,x);

%% Different point to process
if Subscript == 0
    n_y=n_z_to_process;
    y=z_to_process;

elseif Subscript > 0
    for i=1:1:Subscript        
        [n_y,y]=derivative_withcoordinates(n_z_to_process,z_to_process);
        z_to_process=y;
        n_z_to_process=n_y;
    end
    
elseif Subscript < 0
    for i=1:1:abs(Subscript)
        [n_y,y]=integration_withcoordinates(n_z_to_process,z_to_process);
        z_to_process=y;
        n_z_to_process=n_y;
    end
end