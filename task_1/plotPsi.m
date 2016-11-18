close all;

%% TASK 1B
%% load psi
load('psi_w005.mat');
t = compass(1,:);
psi1 = compass(2,:);


load('psi_w05.mat');
psi2 = compass(2,:);

%% Plot psi 

subplot(2,2,1);
plot(t, psi1); title('Task 1b,  w = 0.005'); legend('Psi(t, w=0.005)'); xlabel('time [s]'); ylabel('course [deg]');

subplot(2,2,2);
plot(t, psi2); title('Task 1b,  w = 0.05'); legend('Psi(t, w=0.05)'); xlabel('time [s]'); ylabel('course [deg]');

%% TASK 1C
%% Load psi with waves and measurement noise
load('psi_w005_noise.mat');
t = compass(1,:);
psi3 = compass(2,:);


load('psi_w05_noise.mat');
psi4 = compass(2,:);

%% Plot psi with waves and measurement noise
subplot(2,2,3);
plot(t, psi3); title('Task 1c,  w = 0.005, including {waves, noise}'); legend('Psi(t, w=0.005)'); xlabel('time [s]'); ylabel('course [deg]');

subplot(2,2,4);
plot(t, psi4); title('Task 1c,  w = 0.05, including {waves, noise}'); legend('Psi(t, w=0.05)'); xlabel('time [s]'); ylabel('course [deg]');

print -depsc paramPlots


%% TASK 1D
%% Load and plot psi given unit step
load('psi_w=u(t).mat');
t = compass(1,:);
psi5 = compass(2,:);

figure;

plot(t, psi5); title('Task 1d, u(t) = unitStep(t)'); legend('Psi(t)'); xlabel('time [s]'); ylabel('course [deg]');

print -depsc unitStepPlot



