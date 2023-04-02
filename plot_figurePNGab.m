close all;
load Data_resultPNGab.mat


figure(1);
plot3(llamm1,ffaim1,HHm1/1000,'r--','LineWidth',2);
hold on
plot3(llamm2,ffaim2,HHm2/1000,'b--','LineWidth',2);
plot3(llamm3,ffaim3,HHm3/1000,'g--','LineWidth',2);
plot3(llamm4,ffaim4,HHm4/1000,'c--','LineWidth',2);
plot3(llamt,ffait,HHt/1000,'ko','LineWidth',2);
xl = xlabel('λ/°');
yl = ylabel('φ/°');
zl = zlabel('H/km');
set(xl,'FontSize',15);
set(yl,'FontSize',15);
set(zl,'FontSize',15);
legend('1号飞行器','2号飞行器','3号飞行器','4号飞行器','目标');
% ,'Location','NorthEastOutside');
title('弹道曲线');
grid on;
hold off

figure(11);
plot(llamm1,ffaim1,'r--','LineWidth',2);
hold on
plot(llamm2,ffaim2,'b--','LineWidth',2);
plot(llamm3,ffaim3,'g--','LineWidth',2);
plot(llamm4,ffaim4,'c--','LineWidth',2);
plot(llamt,ffait,'ko','LineWidth',2);
xl = xlabel('λ/°');
yl = ylabel('φ/°');
set(xl,'FontSize',15);
set(yl,'FontSize',15);
legend('1号飞行器','2号飞行器','3号飞行器','4号飞行器','目标');
title('弹道曲线');
grid on;
hold off

figure(2);
plot(tt1,ttheta1/pi*180,'r','LineWidth',2);
hold on
plot(tt2,ttheta2/pi*180,'b','LineWidth',2);
plot(tt3,ttheta3/pi*180,'g','LineWidth',2);
plot(tt4,ttheta4/pi*180,'c','LineWidth',2);
xlabel('t/s');
ylabel('θ/°');
legend('1号飞行器','2号飞行器','3号飞行器','4号飞行器');
title('弹道倾角');
grid on;
hold off

figure(3);
plot(tt1,ppusai1/pi*180,'r','LineWidth',2);
hold on
plot(tt2,ppusai2/pi*180,'b','LineWidth',2);
plot(tt3,ppusai3/pi*180,'g','LineWidth',2);
plot(tt4,ppusai4/pi*180,'c','LineWidth',2);
xlabel('t/s');
ylabel('ψ/°');
legend('1号飞行器','2号飞行器','3号飞行器','4号飞行器');
title('弹道偏角');
grid on;
hold off

figure(4);
plot(tt1,eetz1/pi*180,'r','LineWidth',2);
hold on
plot(tt2,eetz2/pi*180,'b','LineWidth',2);
plot(tt3,eetz3/pi*180,'g','LineWidth',2);
plot(tt4,eetz4/pi*180,'c','LineWidth',2);
xlabel('t/s');
ylabel('etz/°');
legend('1号飞行器','2号飞行器','3号飞行器','4号飞行器');
title('视线前置角俯仰方向偏量');
grid on;
hold off

figure(5);
plot(tt1,eety1/pi*180,'r','LineWidth',2);
hold on
plot(tt2,eety2/pi*180,'b','LineWidth',2);
plot(tt3,eety3/pi*180,'g','LineWidth',2);
plot(tt4,eety4/pi*180,'c','LineWidth',2);
xlabel('t/s');
ylabel('ety/°');
legend('1号飞行器','2号飞行器','3号飞行器','4号飞行器');
title('视线前置角偏航方向偏量');
grid on;
hold off

% figure(6);
% plot(tt,eet1,'r','LineWidth',2);
% hold on
% plot(tt,eet2,'b','LineWidth',2);
% hold on
% plot(tt,eet3,'g','LineWidth',2);
% xlabel('t/s');
% ylabel('et');
% legend('1号攻击弹','2号攻击弹','3号攻击弹');
% title('导弹i剩余时间与平均剩余时间差值');
% grid on;
% hold off
figure(10);
plot(tt1,vv1,'r','LineWidth',2);
hold on
plot(tt2,vv2,'b','LineWidth',2);
plot(tt3,vv3,'g','LineWidth',2);
plot(tt4,vv4,'c','LineWidth',2);
xlabel('t/s');
ylabel('V');
legend('1号飞行器','2号飞行器','3号飞行器','4号飞行器');
title('速度变化');
grid on;
hold off

figure(6);
plot(tt1,ttgo_1,'r','LineWidth',1.5);
hold on
plot(tt2,ttgo_2,'b','LineWidth',1.5);
plot(tt3,ttgo_3,'g','LineWidth',1.5);
plot(tt4,ttgo_4,'c','LineWidth',1.5);
% hold on
% plot(tt,ttgo_av,'k','LineWidth',1.5);
xlabel('t/s');
ylabel('tgo/s');
legend('1号飞行器','2号飞行器','3号飞行器','4号飞行器');
title('剩余飞行时间');
grid on;
hold off



figure(7);
plot(tt1,aay1,'c','LineWidth',1.5);
hold on
plot(tt1,aay1_real,'r--','LineWidth',1.5);
plot(tt2,aay2,'b','LineWidth',1.5);
plot(tt2,aay2_real,'m--','LineWidth',1.5);
plot(tt3,aay3,'g','LineWidth',1.5);
plot(tt3,aay3_real,'k--','LineWidth',1.5);
plot(tt4,aay4,'c','LineWidth',1.5);
plot(tt4,aay4_real,'g--','LineWidth',1.5);
xlabel('t/s');
ylabel('ay/(m/s^2)');
legend('1号-指令过载','1号-实际过载','2号-指令过载','2号-实际过载','3号-指令过载','3号-实际过载','4号-指令过载','4号-实际过载');
title('侧向加速度');
grid on;
hold off

figure(8);
plot(tt1,aaz1,'c','LineWidth',1.5);
hold on
plot(tt1,aaz1_real,'r--','LineWidth',1.5);
plot(tt2,aaz2,'b','LineWidth',1.5);
plot(tt2,aaz2_real,'m--','LineWidth',1.5);
plot(tt3,aaz3,'g','LineWidth',1.5);
plot(tt3,aaz3_real,'k--','LineWidth',1.5);
plot(tt4,aaz4,'c','LineWidth',1.5);
plot(tt4,aaz4_real,'g--','LineWidth',1.5);
xlabel('t/s');
ylabel('az/(m/s^2)');
legend('1号-指令过载','1号-实际过载','2号-指令过载','2号-实际过载','3号-指令过载','3号-实际过载','4号-指令过载','4号-实际过载');
title('纵向加速度');
grid on;
hold off

figure(9);
plot(tt1,rr1/1000,'r','LineWidth',2);
hold on
plot(tt2,rr2/1000,'b','LineWidth',2);
plot(tt3,rr3/1000,'g','LineWidth',2);
plot(tt4,rr4/1000,'c','LineWidth',2);
xlabel('t/s');
ylabel('r/km');
legend('1号飞行器','2号飞行器','3号飞行器','4号飞行器');
title('弹目距离');
grid on;
hold off

figure(12);
plot(tt1,yym1/1000,'r','LineWidth',2);
hold on
plot(tt2,yym2/1000,'b','LineWidth',2);
plot(tt3,yym3/1000,'g','LineWidth',2);
plot(tt4,yym4/1000,'c','LineWidth',2);
xlabel('t/s');
ylabel('H/km');
legend('1号飞行器','2号飞行器','3号飞行器','4号飞行器');
title('高度H');
grid on;
hold off

figure(13);
plot(tt1,aalpha1/pi*180,'r','LineWidth',2);
hold on
plot(tt2,aalpha2/pi*180,'b','LineWidth',2);
plot(tt3,aalpha3/pi*180,'g','LineWidth',2);
plot(tt4,aalpha4/pi*180,'c','LineWidth',2);
xlabel('t/s');
ylabel('et');
legend('1号飞行器','2号飞行器','3号飞行器','4号飞行器');
title('视线前置角');
grid on;
hold off