close all

%% Load the wave file and assign variables
load('wave.mat');
t = psi_w(1,:);
x = psi_w(2,:)*pi/180;  % psi_w(2,:) has unit 

%% Set parameters and calculate Power Spectral Density

window = 4096;
fs = 10;

[Pxx,f] = pwelch(x,window,[],[],fs);



plot (f*2*pi, Pxx/(2*pi));
xlim([0 2]); grid on;
xlabel('Frequency [rad/s]'); ylabel('[s/rad]');
legend('Estimated \fontsize{12} {S}_{\psiw}');


%% Find resonance frequency
[m i] = max(Pxx);
w_max = f(i)*2*pi;
w_0 = w_max;
sig = nthroot(pw0, 1)

line([w_0 w_0],[0 0.0015])
pw0 = m;
sig = nthroot(pw0, 1)
