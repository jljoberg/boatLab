close all; hold on;

load('ref.mat');
load('Compass.mat');
load('Rudder.mat');
load('bHat');
load('estimateHeading.mat');
load('psiWave.mat');
load('waveInfluence.mat');

t = ref(1,:);
t2 = bHat(1,:);

h1 = plot(t, ref(2,:));
h2 = plot(t, Compass(2,:));
h3 = plot(t, Rudder(2,:));
h4 = plot(t2, bHat(2,:));
xlim([0 800]); xlabel('Time [s]'); ylabel('Angle [deg]');
legend('Reference heading','Compass','Rudder angle','Estimated rudder bias');
h1.LineWidth = 1.5;
h2.LineWidth = 2;
h4.LineWidth = 2.5; h4.LineStyle = ':';

print -depsc plotKalman1
%%
t3 = estimateHeading(1,:);

figure; hold on;
H1 = plot(t, ref(2,:));
H2 = plot(t, Compass(2,:));
H3 = plot(t3, estimateHeading(2,:));
xlim([0 2000]);
legend('Reference heading', 'Compass heading', 'Estimated average heading \psi')

H3.LineWidth=2; H3.Color='g';
print -depsc plotKalman2

%%
figure; hold on;
load('psiWave.mat');
load('waveInfluence.mat');
t4 = psiWave(1,:);



H1 = plot(t, waveInfluence(2,:));
H2 = plot(t4, psiWave(2,:));
xlim([0 300]);
legend('Real wave influence','Estimated wave influence')

H2.LineWidth=1; H2.Color='g'; H2.LineStyle='--';
print -depsc plotKalmanWave



