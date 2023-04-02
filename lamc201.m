load datad;
% lamc=121.57;
% faic=38.93;
lamc=handles.lam0;
faic=handles.fai0;
Hc=0;
lam1=lamm01;
lam2=lamm02;
lam3=lamm03;
fai1=faim01;
fai2=faim02;
fai3=faim03;
H1=Hm01;
H2=Hm02;
H3=Hm03;

kfai1=-0.1;
t11=round((fai1-faic)/kfai1);
klam1=(lam1-lamc)/t11;
t1=0:1:t11;
lam11=lamc+klam1*t1;
fai11=faic+kfai1*t1;
a1=-H1/t11^2;
b1=2*H1/t11;
H11=a1*t1.^2+b1*t1;

kfai2=-0.1;
t22=round((fai2-faic)/kfai2);
klam2=(lam2-lamc)/t22;
t2=0:1:t22;
lam22=lamc+klam2*t2;
fai22=faic+kfai2*t2;
a2=-H2/t22^2;
b2=2*H2/t22;
H22=a2*t2.^2+b2*t2;

kfai3=-0.1;
t33=round((fai3-faic)/kfai3);
klam3=(lam3-lamc)/t33;
t3=0:1:t33;
lam33=lamc+klam3*t3;
fai33=faic+kfai3*t3;
a3=-H3/t33^2;
b3=2*H3/t33;
H33=a3*t3.^2+b3*t3;

cc0=[lamc,faic,Hc];
cc1=[t1,lam11,fai11,H11];
cc2=[t2,lam22,fai22,H22];
cc3=[t3,lam33,fai33,H33];

save cc0 cc0
save cc1 cc1
save cc2 cc2
save cc3 cc3
% save cc0
% save cc1
% save cc2
% save cc3

% plot2;
lamfaic;
