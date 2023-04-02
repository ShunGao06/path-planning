function rho=AirRhoCal(h)
% Atmosphere Model
a0=-0.009334500409893852;
a1=-0.07713480853494097;
a2=-0.00382948508292597;
a3=5.242803244759748E-05;
a4=6.454862591920205E-07;
a5=-2.031133609734722E-08;
a6=1.568378909033718E-10;
a7=-3.928350728483702E-13;

a=340.29112;
b=-0.87245462;
c=-300.10255;
d=0.3077688;
e=106.65518;
f=-0.052091446;
g=-18.273173;

ch=0.004143208;
ci=1.485658;
cj=-0.00012124848;
ck=-0.045201417;

temp1=a0+a1*h./1000+a2*(h./1000).^2+a3*(h./1000).^3+a4*(h./1000).^4+a5*(h./1000).^5+a6*(h./1000).^6+a7*(h./1000).^7;

rho=1.225.*(h<=130000.0).*exp(temp1);
