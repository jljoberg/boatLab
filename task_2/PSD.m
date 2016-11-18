close all

%% Load the wave file and assign variables
load('wave.mat');
t = psi_w(1,:);
x = psi_w(2,:)*pi/180;  % psi_w(2,:) has unit 

%% Set parameters and calculate Power Spectral Density
window = 4096;
fs = 10;

[pxx,f] = pwelch(x,window,[],[],fs);
Pxx = pxx./(2*pi);
w = 2*pi*f;

plot (w, Pxx);
xlim([0 2]); grid on;
xlabel('Frequency [rad/s]'); ylabel('[s/rad]');


%% Find resonance frequency w0, sigma and lambda
[m, i] = max(Pxx);
w_max = f(i)*2*pi;
w_0 = w_max;
sigma = sqrt(m);
l = 0.085;

%% Plot analytic with estimate
PAnalytic = PxFun(w_0, l, sigma);
hold on; plot(w, PAnalytic,'r', 'LineStyle', '--');
legend('Estimated \fontsize{12} {S}_{\psiw}', 'Analytic \fontsize{12} {P}_{\psiw}')
print -depsc PSDcompare

