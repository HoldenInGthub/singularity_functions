clc
clear all
close all

%% Define the time interval and accuracy
lim1 = -1;
lim2 = 20;
N = 1000;

%% Using the function to calculate the output
[n1,unit_impluse_signal]=singularity_functions(lim1,lim2,N,0);
[n2,unit_doublet_signal]=singularity_functions(lim1,lim2,N,1);
[n3,unit_ramp_signal]=singularity_functions(lim1,lim2,N,-2);

%% plot the function
figure(1);
subplot(311);
plot(n1,unit_impluse_signal);
title("unit impluse signal");
grid on;

subplot(312);
plot(n2,unit_doublet_signal);
title("unit doublet signal");
grid on;

subplot(313);
plot(n3,unit_ramp_signal);
title("unit ramp signal");
grid on;