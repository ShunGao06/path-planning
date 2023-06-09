function sos=airSpeedCal(h)

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



tempz=min(85.0,h./1000).*ones(size(h));
tempz=max(tempz,0);

d1=a+c*(tempz).^(1/2.0)+e*tempz+g*(tempz).^(3/2.0)+ci*(tempz).^(4/2.0)+ck*(tempz).^(5/2.0);
d2=1.0+b*(tempz).^(1/2.0)+d*tempz+f*(tempz).^(3/2.0)+ch*(tempz).^(4/2.0)+cj*(tempz).^(5/2.0);

sos=d1./d2;
