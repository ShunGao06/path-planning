close all;
load Data_resultPNGn.mat


figure(1);
plot3(llamm1,ffaim1,HHm1/1000,'r','LineWidth',2);
hold on
plot3(llamm2,ffaim2,HHm2/1000,'b','LineWidth',2);
plot3(llamm3,ffaim3,HHm3/1000,'g','LineWidth',2);
plot3(llamt,ffait,HHt/1000,'ko','LineWidth',2);
xl = xlabel('$\lambda/deg$','Interpreter','latex');
yl = ylabel('$\phi/deg$','Interpreter','latex');
zl = zlabel('$H/km$','Interpreter','latex');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(zl,'FontSize',18);
legend('Missile1','Missile2','Missile3','Target');
% ,'Location','NorthEastOutside');
% title('��������');
grid on;
hold off

figure(2);
plot(llamm1,ffaim1,'r','LineWidth',2);
hold on
plot(llamm2,ffaim2,'b','LineWidth',2);
plot(llamm3,ffaim3,'g','LineWidth',2);
plot(llamt,ffait,'ko','LineWidth',2);
xl = xlabel('$\lambda/deg$','Interpreter','latex');
yl = ylabel('$\phi/deg$','Interpreter','latex');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
legend('Missile1','Missile2','Missile3','Target');
% title('��������');
grid on;
hold off

% figure(2);
% plot(tt1,NN1,'r','LineWidth',2);
% hold on
% plot(tt2,NN2,'b','LineWidth',2);
% plot(tt3,NN3,'g','LineWidth',2);
% xlabel('t/s');
% ylabel('N');
% legend('1�ŷ�����','2�ŷ�����','3�ŷ�����');
% title('����ϵ��');
% grid on;
% hold off

figure(3);
plot(tt1,ttheta1/pi*180,'r','LineWidth',2);
hold on
plot(tt2,ttheta2/pi*180,'b','LineWidth',2)
plot(tt3,ttheta3/pi*180,'g','LineWidth',2);
xl = xlabel('$t/s$','Interpreter','latex');
y1 = ylabel('$theta/deg$','Interpreter','latex');
legend('Missile1','Missile2','Missile3');
% title('�������');
grid on;
hold off

% figure(4);
% plot(tt1,ppusai1/pi*180,'r','LineWidth',2);
% hold on
% plot(tt2,ppusai2/pi*180,'b','LineWidth',2);
% plot(tt3,ppusai3/pi*180,'g','LineWidth',2);
% x1=xlabel('t/s');
% y1=ylabel('��/��');
% legend('1�ŷ�����','2�ŷ�����','3�ŷ�����');
% title('����ƫ��');
% grid on;
% hold off

% figure(5);
% plot(tt1,ttgo_1,'r','LineWidth',1.5);
% hold on
% plot(tt2,ttgo_2,'b','LineWidth',1.5);
% plot(tt3,ttgo_3,'g','LineWidth',1.5);
% % plot(tt,ttgo_av,'k','LineWidth',1.5);
% x1=xlabel('t/s');
% y1=ylabel('tgo/s');
% legend('1�ŷ�����','2�ŷ�����','3�ŷ�����');
% title('ʣ�����ʱ��');
% grid on;
% hold off

% figure(6);
% plot(tt,sst,'k','LineWidth',2);
% xlabel('t/s');
% ylabel('��/s^2');
% title('ʣ�����ʱ�䷽��');
% grid on;
% hold off

figure(7);
plot(tt1,aay1,'c','LineWidth',1.5);
hold on
plot(tt1,aay1_real,'r--','LineWidth',1.5);
plot(tt2,aay2,'b','LineWidth',1.5);
plot(tt2,aay2_real,'m--','LineWidth',1.5);
plot(tt3,aay3,'g','LineWidth',1.5);
plot(tt3,aay3_real,'k--','LineWidth',1.5);
xl = xlabel('$t/s$','Interpreter','latex');
y1 = ylabel('$ay/(m/s^2)$','Interpreter','latex');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
legend('Missile1-require','Missile1-real','Missile2-require','Missile2-real','Missile3-require','Missile3-real');
% title('������ٶ�');
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
xl = xlabel('$t/s$','Interpreter','latex');
y1 = ylabel('$az/(m/s^2)$','Interpreter','latex');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
legend('Missile1-require','Missile1-real','Missile2-require','Missile2-real','Missile3-require','Missile3-real');
% title('������ٶ�');
grid on;
hold off
% 
% figure(11);
% plot(tt1,rr1/1000,'r','LineWidth',2);
% hold on
% plot(tt2,rr2/1000,'b','LineWidth',2);
% plot(tt3,rr3/1000,'g','LineWidth',2);
% xlabel('t/s');
% ylabel('r/km');
% legend('1�ŷ�����','2�ŷ�����','3�ŷ�����');
% title('��Ŀ����');
% grid on;
% hold off

figure(12);
plot(tt1,HHm1/1000,'r','LineWidth',2);
hold on
plot(tt2,HHm2/1000,'b','LineWidth',2);
plot(tt3,HHm3/1000,'g','LineWidth',2);
xl = xlabel('$t/s$','Interpreter','latex');
yl = ylabel('$H/km$','Interpreter','latex');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
legend('Missile1','Missile2','Missile3');
% title('�߶�H');
grid on;
hold off
% 
% figure(13);
% plot(tt1,aalpha1/pi*180,'r','LineWidth',2);
% hold on
% plot(tt2,aalpha2/pi*180,'b','LineWidth',2);
% plot(tt3,aalpha3/pi*180,'g','LineWidth',2);
% xlabel('t/s');
% ylabel('et');
% legend('1�ŷ�����','2�ŷ�����','3�ŷ�����');
% title('����ǰ�ý�');
% grid on;
% hold off
% % set(xl,'FontSize',18);
% % set(yl,'FontSize',18);
% % set(zl,'FontSize',18);
