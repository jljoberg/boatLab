close all; hold on;

load('ref.mat');
load('Compass.mat');
load('Rudder.mat');
load('bHat.mat');

t = ref(1,:);
t1 = bHat(1,:);

h1 = plot(t, ref(2,:));
h2 = plot(t, Compass(2,:));
h3 = plot(t, Rudder(2,:));
h4 = plot(t1, bHat(2,:));
xlim([0 800]); xlabel('Time [s]'); ylabel('Angle [deg]');

legend('Reference heading','Compass','Rudder angle','Estimated rudder bias');
h1.LineWidth = 1.5;
h2.LineWidth = 2;
h4.LineWidth = 2.5; h4.LineStyle = ':';

print -depsc plotKalmanCurrent