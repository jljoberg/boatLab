function P = PxFun(w0, l, sig)
N = 2049;
f = linspace(0,5,N);
w = 2*pi*f;
K = 2*l*w0*sig;

P = K^2*w.^2./(w.^4 + w.^2*(4*l^2-2) + w0^4 );
P = P';


end