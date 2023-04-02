close all
clear;

figure(1)
%%
load Missle1.mat
T1=FlyData;
load Missle2.mat
T2=FlyData;
load Missle3.mat
T3=FlyData;
load Missle4.mat
T4=FlyData;
lambda1=T1(:,8)*180/pi;
phi1=T1(:,9)*180/pi;
h1=T1(:,2)/1000;
plot3(lambda1,phi1,h1,'r','LineWidth',1.7);
hold on
lambda2=T2(:,8)*180/pi;
phi2=T2(:,9)*180/pi;
h2=T2(:,2)/1000;
plot3(lambda2,phi2,h2,'b','LineWidth',1.7);
hold on
lambda3=T3(:,8)*180/pi;
phi3=T3(:,9)*180/pi;
h3=T3(:,2)/1000;
plot3(lambda3,phi3,h3,'g','LineWidth',1.7);
hold on
lambda4=T4(:,8)*180/pi;
phi4=T4(:,9)*180/pi;
h4=T4(:,2)/1000;
plot3(lambda4,phi4,h4,'c','LineWidth',1.7);
hold on
%%
load Data_ResultPNGn
c1=plot3(llamm1,ffaim1,HHm1/1000,'r','LineWidth',1.7);
c2=plot3(llamm2,ffaim2,HHm2/1000,'b','LineWidth',1.7);
c3=plot3(llamm3,ffaim3,HHm3/1000,'g','LineWidth',1.7);
c5=plot3(llamm4,ffaim4,HHm4/1000,'c','LineWidth',1.7);
c4=plot3(llamt,ffait,HHt/1000,'ko','LineWidth',2);
xl = xlabel('λ/°');
yl = ylabel('φ/°');
zl = zlabel('H/km');
set(xl,'FontSize',15);
set(yl,'FontSize',15);
set(zl,'FontSize',15);
legend;
legend([c1,c2,c3,c5,c4],{'Missile1','Missile2','Missile3','Missile4','Target'});
grid on;
hold off
view(-81,10);


%%
% figure(3)
% % load datad
% % plot(tm,SW11/1000000,'r','LineWidth',1.7);
% % hold on
% % plot(tm,SW21/1000000,'m','LineWidth',1.7); 
% % plot(tm,SL1/1000000,'g','LineWidth',1.7); 
% %%
% load Missle1.mat
% T1=FlyData;
% load Missle2.mat
% T2=FlyData;
% load Missle3.mat
% T3=FlyData;
% 
% t1=T1(:,end);
% S1=T1(:,(end-1));
% plot(t1,S1/1000000,'r','LineWidth',1.7);
% hold on
% t2=T2(:,end);
% S2=T2(:,(end-1));
% plot(t2,S2/1000000,'m','LineWidth',1.7);
% hold on
% t3=T3(:,end);
% S3=T3(:,(end-1));
% plot(t3,S3/1000000,'g','LineWidth',1.7);
% hold on 
% %%
% load Data_ResultPNGn
% c1=plot(tt1_real,SW13/1000000,'r','LineWidth',1.7);
% c2=plot(tt2_real,SW23/1000000,'m','LineWidth',1.7);
% c3=plot(tt3_real,SL3/1000000,'g','LineWidth',1.7);
% xl = xlabel('t/s');
% yl = ylabel('S/(×10^3km)');
% set(xl,'FontSize',15);
% set(yl,'FontSize',15);
% legend;
% legend([c1,c2,c3],{'Missile1','Missile2','Missile3'},'Location','SouthEast');
% % title('航程S-时间t');
% grid on;
% hold off

figure(2)
load Missle1.mat
T1=FlyData;
load Missle2.mat
T2=FlyData;
load Missle3.mat
T3=FlyData;
load Missle4.mat
T4=FlyData;

t1=T1(:,end)-T1(1,end);
h1=T1(:,2)/1000;
plot(t1,h1,'r','LineWidth',1.7);
hold on
t2=T2(:,end)-T2(1,end);
h2=T2(:,2)/1000;
plot(t2,h2,'b','LineWidth',1.7);
hold on
t3=T3(:,end)-T3(1,end);
h3=T3(:,2)/1000;
plot(t3,h3,'g','LineWidth',1.7);
hold on 
t4=T4(:,end)-T4(1,end);
h4=T4(:,2)/1000;
plot(t4,h4,'c','LineWidth',1.7);
hold on 
%%
load Data_ResultPNGn
c1=plot(tt1-T1(1,end),HHm1/1000,'r','LineWidth',1.7,'DisplayName','1号飞行器');
c2=plot(tt2-T2(1,end),HHm2/1000,'b','LineWidth',1.7,'DisplayName','2号飞行器');
c3=plot(tt3-T3(1,end),HHm3/1000,'g','LineWidth',1.7,'DisplayName','3号飞行器');
c4=plot(tt4-T4(1,end),HHm4/1000,'c','LineWidth',1.7,'DisplayName','4号飞行器');
xl = xlabel('t/s');
yl = ylabel('H/km');
set(xl,'FontSize',15);
set(yl,'FontSize',15);
legend;
legend([c1,c2,c3,c4],{'Missile1','Missile2','Missile3','Missile4'});
% title('高度H-时间t');
grid on;
hold off

figure(3)
load Missle1.mat
T1=FlyData;
load Missle2.mat
T2=FlyData;
load Missle3.mat
T3=FlyData;
load Missle4.mat
T4=FlyData;
lambda1=T1(:,8)*180/pi;
phi1=T1(:,9)*180/pi;
plot(lambda1,phi1,'r','LineWidth',1.7);
hold on
lambda2=T2(:,8)*180/pi;
phi2=T2(:,9)*180/pi;
plot(lambda2,phi2,'b','LineWidth',1.7);
hold on
lambda3=T3(:,8)*180/pi;
phi3=T3(:,9)*180/pi;
plot(lambda3,phi3,'g','LineWidth',1.7);
hold on
lambda4=T4(:,8)*180/pi;
phi4=T4(:,9)*180/pi;
plot(lambda4,phi4,'c','LineWidth',1.7);
hold on
%%
load Data_ResultPNGn
c1=plot(llamm1,ffaim1,'r','LineWidth',1.7);
c2=plot(llamm2,ffaim2,'b','LineWidth',1.7);
c3=plot(llamm3,ffaim3,'g','LineWidth',1.7);
c5=plot(llamm4,ffaim4,'c','LineWidth',1.7);
c4=plot(llamt,ffait,'ko','LineWidth',2);
xl = xlabel('λ/°'); 
yl = ylabel('φ/°');
set(xl,'FontSize',15);
set(yl,'FontSize',15);
legend;
legend([c1,c2,c3,c5,c4],{'Missile1','Missile2','Missile3','Missile4','Target'});
% title('飞行轨迹','FontSize',15);
grid on;
hold off
