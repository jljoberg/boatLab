close all;

%% load psi
load('psi_w005.mat');
t = compass(1,:);
psi1 = compass(2,:);


load('psi_w05.mat');
psi2 = compass(2,:);

%% Plot psi 

subplot(2,1,1);
plot(t, psi1); title('Task 1b,  w = 0.005'); legend('Psi(t, w=0.005)'); xlabel('time [s]')

subplot(2,1,2);
plot(t, psi2); title('Task 1b,  w = 0.05'); legend('Psi'); xlabel('time [s]')
