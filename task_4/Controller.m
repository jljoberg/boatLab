Kpd = 0.749;
K = 0.1743 ;
Tf = 8.391;
Td  = 87.14;

t = Angel(1,:);
phi = ref(2,:);
phir = Angel(2,:);
plot(t, phir)

hold on
plot(t, phi)
xlabel('Time(s)')
ylabel('Course angel(deg)')
hold on
plot(t, rudder(2,:))
xlabel('Time(s)')
ylabel('Course angel(deg)')
hold off

legend('Compass value','Desired Course angel','Rudder input')