
%% Setting up Continous Model
sigma = 0.0385;
lambda = 0.085;
omega0 = 0.7823;

K = 0.1743;
T = 87.14;
Kw= 2*lambda*omega0*sigma;
Ac = [0 1 0 0 0; -omega0^2 -lambda*2*omega0 0 0 0; 0 0 0 1 0; 0 0 0 -1/T -K/T; 0 0 0 0 0];
Bc = [ 0; 0; 0; K/T; 0];
Ec = [0 0 ; Kw 0; 0 0 ; 0 1; 0 0];
Cc = [0 1 1 0 0];
Dc = 0;
Qc = diag([30, 10^-6]);
    

%% Loan method
fs = 10; Ts = 1/fs; % Sampling frequency fs and period Ts

S = Ec*Qc*Ec'; H = [Ac S; zeros(5) -Ac']; M = expm(H*Ts);
M11 = M(1:5,1:5); M12 = M(1:5,6:10); M22 = M(6:10,6:10);
Ad = M11;
Qd = M12*M11';

H = [Ac Bc; zeros(1,5) zeros(1,1)];  N = expm(H*Ts);
Bd = N(1:5,6);

H = [Ac Ec; zeros(2,5) zeros(2,2)];  N = expm(H*Ts);
Ed = N(1:5,6:7);


%% variance calculator
load('mNoise.mat')      %Remember to run mNoise.mdl to init mNoise.mat
noiseVar  = var(mNoise(2,:)*pi/180);

%% Discretezations not covered by Van Loan
Rd = noiseVar/Ts;
Cd = Cc; Dd = Dc;

%% INIT Controller gains
Kpd = 0.749;
K = 0.1743 ;
Tf = 8.391;
Td  = 87.14;

%% INIT KALMAN
x0_ = zeros(5,1);
P0_ = diag([1, 0.013, pi^2, 1, 2.5*10^-4]);

data = struct( 'Ad',Ad,  'Bd',Bd ,  'Cd',Cd ,  'Ed',Ed ,  'Qd',Qd ,  'Rd',Rd ,  'P0_',P0_ , 'x0_',x0_ );



