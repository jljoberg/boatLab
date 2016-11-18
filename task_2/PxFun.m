function Px = PxFun(w0, l, sig)
N = 2049;
f = linspace(0,5,N);
w = 2*pi*f;
K = 2*l*w0*sig;

Px = K^2*w.^2./(w.^4 + w0^2.*w.^2*(4*l^2-2) + w0^4 );
Px = Px';
end