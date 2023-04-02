close all
% clear;

% figure(10)
% load cc0.mat
% load cc1.mat
% load cc2.mat
% load cc3.mat
% %%
% c0=plot3(lamc,faic,Hc/1000,'bp','LineWidth',2); 
% hold on
% plot3(lam11,fai11,H11/1000,'g','LineWidth',1.7); 
% plot3(lam22,fai22,H22/1000,'r','LineWidth',1.7); 
% plot3(lam33,fai33,H33/1000,'m','LineWidth',1.7); 
% %%
% load Data_Road.mat
% HF=[26:0.1:30]';
% hl=length(HF);
% for o=1:hl
% plot3(lamF1,faiF*ones(size(lamF1)),HF(o),'k.');
% plot3(lamF2,faiF*ones(size(lamF2)),HF(o),'k.');
% plot3(lamF*ones(size(faiF1)),faiF1,HF(o),'k.');
% plot3(lamF*ones(size(faiF2)),faiF2,HF(o),'k.');
% end
% %%
% plot3(lamLn,faiLn,Hn/1000,'gd','LineWidth',1.5); 
% plot3(lamW1n,faiW1n,Hn/1000,'rs','LineWidth',1.5);
% plot3(lamW2n,faiW2n,Hn/1000,'ms','LineWidth',1.5); 
% plot3(llamL,ffaiL,Hm/1000,'g','LineWidth',1.7); 
% plot3(llamW1,ffaiW1,Hm/1000,'r','LineWidth',1.7); 
% plot3(llamW2,ffaiW2,Hm/1000,'m','LineWidth',1.7); 
%%
load Missle1.mat
T1=FlyData;
load Missle2.mat
T2=FlyData;
load Missle3.mat
T3=FlyData;

lambda1=T1(:,8)*180/pi;
phi1=T1(:,9)*180/pi;
h1=T1(:,2)/1000;
plot3(lambda1,phi1,h1,'r','LineWidth',1.7);
lambda2=T2(:,8)*180/pi;
phi2=T2(:,9)*180/pi;
h2=T2(:,2)/1000;
plot3(lambda2,phi2,h2,'m','LineWidth',1.7);
lambda3=T3(:,8)*180/pi;
phi3=T3(:,9)*180/pi;
h3=T3(:,2)/1000;
plot3(lambda3,phi3,h3,'g','LineWidth',1.7);
hold on
%%
load Data_ResultPNGn
c1=plot3(llamm1,ffaim1,HHm1/1000,'r','LineWidth',1.7,'DisplayName','跟从飞行器1');
c2=plot3(llamm2,ffaim2,HHm2/1000,'m','LineWidth',1.7,'DisplayName','跟从飞行器2');
c3=plot3(llamm3,ffaim3,HHm3/1000,'g','LineWidth',1.7,'DisplayName','领航飞行器');
c4=plot3(llamt,ffait,HHt/1000,'ko','LineWidth',2,'DisplayName','目标');
xl = xlabel('λ/°');
yl = ylabel('φ/°');
zl = zlabel('H/km');
set(xl,'FontSize',15);
set(yl,'FontSize',15);
set(zl,'FontSize',15);
legend;
legend([c0 c1,c2,c3,c4],{'起点','跟从飞行器1','跟从飞行器2','领航飞行器','目标'});
title('飞行轨迹','FontSize',15);
grid on;
hold off
view(-101,70);

%%
figure(2)
load datad
plot(tm,Hm/1000,'r','LineWidth',1.7);
hold on
plot(tm,Hm/1000,'m','LineWidth',1.7); 
plot(tm,Hm/1000,'g','LineWidth',1.7); 
%%
load Missle1.mat
T1=FlyData;
load Missle2.mat
T2=FlyData;
load Missle3.mat
T3=FlyData;

t1=T1(:,end);
h1=T1(:,2)/1000;
plot(t1,h1,'r','LineWidth',1.7);
t2=T2(:,end);
h2=T2(:,2)/1000;
plot(t2,h2,'m','LineWidth',1.7);
t3=T3(:,end);
h3=T3(:,2)/1000;
plot(t3,h3,'g','LineWidth',1.7);

hold on 
%%
load Data_ResultPNGn
c1=plot(tt1_real,HHm1/1000,'r','LineWidth',1.7,'DisplayName','1号飞行器');
c2=plot(tt2_real,HHm2/1000,'m','LineWidth',1.7,'DisplayName','2号飞行器');
c3=plot(tt3_real,HHm3/1000,'g','LineWidth',1.7,'DisplayName','3号飞行器');
xl = xlabel('t/s');
yl = ylabel('H/km');
set(xl,'FontSize',15);
set(yl,'FontSize',15);
legend;
legend([c1,c2,c3],{'跟从飞行器1','跟从飞行器2','领航飞行器'});
% title('高度H-时间t');
grid on;
hold off

%%
figure(3)
load datad
plot(tm,SW11/1000000,'r','LineWidth',1.7);
hold on
plot(tm,SW21/1000000,'m','LineWidth',1.7); 
plot(tm,SL1/1000000,'g','LineWidth',1.7); 
%%
load Missle1.mat
T1=FlyData;
load Missle2.mat
T2=FlyData;
load Missle3.mat
T3=FlyData;

t1=T1(:,end);
S1=T1(:,(end-1));
plot(t1,S1/1000000,'r','LineWidth',1.7);
t2=T2(:,end);
S2=T2(:,(end-1));
plot(t2,S2/1000000,'m','LineWidth',1.7);
t3=T3(:,end);
S3=T3(:,(end-1));
plot(t3,S3/1000000,'g','LineWidth',1.7);
hold on 
%%
load Data_ResultPNGn
c1=plot(tt1_real,SW13/1000000,'r','LineWidth',1.7);
c2=plot(tt2_real,SW23/1000000,'m','LineWidth',1.7);
c3=plot(tt3_real,SL3/1000000,'g','LineWidth',1.7);
xl = xlabel('t/s');
yl = ylabel('S/(×10^3km)');
set(xl,'FontSize',15);
set(yl,'FontSize',15);
legend;
legend([c1,c2,c3],{'跟从飞行器1','跟从飞行器2','领航飞行器'},'Location','SouthEast');
% title('航程S-时间t');
grid on;
hold off

