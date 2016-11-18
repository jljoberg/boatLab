%Discretization
sigma = 0.0385;
lambda = 0.085;
omega = 0.7823;
K = 0.1743;
T = 87.14;
Kw= 2*lambda*omega*sigma;
A = [0 1 0 0 0; -omega^2 -lambda*2*omega 0 0 0; 0 0 0 1 0; 0 0 0 -1/T -K/T; 0 0 0 0 0];
B = [ 0; 0; 0; K/T; 0];
E = [0 0 ; Kw 0; 0 0 ; 0 1; 0 0];
C = [0 1 1 0 0];
[Ad, Bd] = c2d(A, B, 1/10);
[Ad, Ed] = c2d(A, E, 1/10);

%variance calculator
V_2  = var(mnoise(2,:)*pi/180)