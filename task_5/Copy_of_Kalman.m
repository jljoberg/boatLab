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
D = 0;

sys1 = ss(A, B, C, D);
sys2 = ss(A, E, C, D);
opt = c2dOptions('Method', 'zoh');
sys1d = c2d(sys1, Ts);   
sys2d = c2d(sys2, Ts);
Ad = sys1d.a;
Bd = sys1d.b;
Cd = C;
Ed = sys2d.b;

%% variance calculator
load('mNoise.mat')      %Remember to run the sim mNoise.mdl to init mNoise.mat
noiseVar  = var(mNoise(2,:)*pi/180);

%% INIT KALMAN

x0_ = zeros(5,1);
P0_ = diag([1, 0.013, pi^2, 1, 2.5*10^-4]);
Qc = diag([30, 10^-6]);
Rd = noiseVar/Ts;

data = struct( 'Ad',Ad,  'Bd',Bd ,  'Cd',Cd ,  'Ed',Ed ,  'Qd',Qc ,  'Rd',Rd ,  'P0_',P0_ , 'x0_',x0_ );
