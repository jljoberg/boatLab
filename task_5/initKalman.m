%% Discretization
sigma = 0.0385;
lambda = 0.085;
omega = 0.7823;
fs = 10; Ts = 1/fs; % Sampling frequency fs and period Ts
K = 0.1743;
T = 87.14;
Kw= 2*lambda*omega*sigma;
A = [0 1 0 0 0; -omega^2 -lambda*2*omega 0 0 0; 0 0 0 1 0; 0 0 0 -1/T -K/T; 0 0 0 0 0];
B = [ 0; 0; 0; K/T; 0];
E = [0 0 ; Kw 0; 0 0 ; 0 1; 0 0];
C = [0 1 1 0 0];
[Ad, Bd] = c2d(A, B, Ts);   
[Ad, Ed] = c2d(A, E, Ts);

%% variance calculator
load('mNoise.mat')      %Remember to run the sim mNoise.mdl to init mNoise.mat
V_2  = var(mNoise(2,:)*pi/180);

%% INIT KALMAN
P0pri = diag([1, 0.013, pi^2, 1, 2.5*10^-4]);
P0priV = P0pri(:)';
x0pri = zeros(5,1);
x0priV = x0pri';
