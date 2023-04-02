clear
load Data18
close all

figure(1);
plot(t_result,H_result/1000,'k','LineWidth',2.4);
% xlabel('\fontsize{12} \bftime/s');
% ylabel('\fontsize{12} \bfAltitude/km');
xlabel(['\fontsize{12}\fontname{宋体}时间\fontname{Times new roman}/s'])
ylabel(['\fontsize{12}\fontname{宋体}高度\fontname{Times new roman}/km'])
grid on;

figure(2);
hold on;
plot(t_result,V_result,'k','LineWidth',2.4);
xlabel(['\fontsize{12}\fontname{宋体}时间\fontname{Times new roman}/s'])
ylabel(['\fontsize{12}\fontname{宋体}速度\fontname{Times new roman}/(m.s^{-1})'])
grid on;
hold off;

% figure(3);
% plot(t_result,L_D_result,'k','LineWidth',2.4);
% xlabel(['\fontsize{12}\fontname{宋体}时间\fontname{Times new roman}/s'])
% ylabel(['\fontsize{12}\fontname{宋体}升阻比\fontname{Times new roman}/km'])
% grid on;

% figure(4);
% hold on;
% plot(t_result,Vdot_result,'k','LineWidth',2.4);
% xlabel(['\fontsize{12}\fontname{宋体}时间\fontname{Times new roman}/s'])
% ylabel(['\fontsize{12}\fontname{宋体}速度变化率\fontname{Times new roman}/(m.s^{-1})'])
% grid on;
% hold off;

% figure(5);
% hold on;
% plot(t_result,e_result,'k',t,e_all,'ro','LineWidth',2.4);
% xlabel('\fontsize{12} \bf时间/s');
% ylabel('\fontsize{12} \bf归一化能量 ');
% grid on;
% hold off;

figure(6);
plot(t_result,sigma_result*180/pi,'b','LineWidth',2.4);
xlabel('\fontsize{12} \bf时间/s');
ylabel('\fontsize{12} \bf倾侧角/（°）');
grid on;
% 
figure(7);
plot(V_result,alpha_result*180/pi,'b','LineWidth',2.4);
xlabel('\fontsize{12} \bf速度/（m.s^{-1}）');
ylabel('\fontsize{12} \bf攻角/（°）');
grid on;

% 
% % figure(8);
% % plot(V_result,H_result/1000,'b','LineWidth',2.4);
% % xlabel('\fontsize{12} \bf速度/（m.s^{-1}）');
% % ylabel('\fontsize{12} \bf高度/（km）');
% % grid on;
% 
figure(9);
hold on
plot(lamda_result*180/pi,fai_result*180/pi,'b',lamda_final*180/pi,fai_final*180/pi,'ro','LineWidth',2.4);
xlabel('\fontsize{12} \bf经度/（°）');
ylabel('\fontsize{12} \bf纬度/（°）');
% plot(lamda_nominal*180/pi,fai_nominal*180/pi,'k-.','LineWidth',2.4)
grid on;

% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % figure(23);
% % plot(t_result,lamda_result*180/pi,'b','LineWidth',2.4);
% % xlabel('\fontsize{12} \bftime (s)');
% % ylabel('\fontsize{12} \bflongitude');
% % legend('Trajectory');
% % grid on;
% % 
% % figure(24);
% % plot(t_result,fai_result*180/pi,'b','LineWidth',2.4);
% % xlabel('\fontsize{12} \bftime (s)');
% % ylabel('\fontsize{12} \bflatitude');
% % legend('Trajectory');
% % grid on;
% 
% 
figure(11);
plot(t_result,gamma_result*180/pi,'b','LineWidth',2.4);
xlabel('\fontsize{12} \bftime');
ylabel('\fontsize{12} \bf弹道倾角');
grid on;
% 
figure(12);
plot(t_result,phi_result*180/pi,'b','LineWidth',2.4);
xlabel('\fontsize{12} \bftime');
ylabel('\fontsize{12} \bf弹道偏角');
grid on;

figure(13);
plot(t_result,delta_phi_result*180/pi,'b','LineWidth',2.4);
xlabel('\fontsize{12} \bftime');
ylabel('\fontsize{12} \bf航向偏差');
grid on;

% figure(14);
% plot(V_result,alpha_result*180/pi,'b','LineWidth',2.4);
% xlabel('\fontsize{12} \bfV');
% ylabel('\fontsize{12} \bfalpha');
% grid on;


% 
% % figure;
% % plot(t_result,SS_result,'b',t_result(i-1),S_all,'ro','LineWidth',2.4);
% % xlabel('\fontsize{12} \bftime');
% % ylabel('\fontsize{12} \bf航程');
% % grid on;
% 
% % figure;
% % plot(t_result,S_togo_result,'b','LineWidth',2.4);
% % xlabel('\fontsize{12} \bftime');
% % ylabel('\fontsize{12} \bf剩余航程');
% % grid on;
% % 
% % figure;
% % plot(t_result,Sp_togo_result,'b','LineWidth',2.4);
% % xlabel('\fontsize{12} \bftime');
% % ylabel('\fontsize{12} \bf剩余航程预测值');
% % grid on;
% 
% % figure;
% % plot(t_result,Sp_final_result,'b','LineWidth',2.4);
% % xlabel('\fontsize{12} \bftime');
% % ylabel('\fontsize{12} \bf终端航程误差预测值');
% % grid on;
% 
% % figure;
% % plot(t_result,1.1*ZZ_up_result,'k--',t_result,1.1*ZZ_down_result,'c--',t_result,ZZ_result,'b','LineWidth',2.4);
% % xlabel('\fontsize{12} \bftime (s)');
% % ylabel('\fontsize{12} \bfcross-range(rad)');
% % legend('Cross-range up edge','Cross-range down edge','Cross-range');
% % grid on;
% 
% % figure;
% % plot(S_togo_Z_result,1.1*ZZ_up_result,'k--',S_togo_Z_result,1.1*ZZ_down_result,'c--',S_togo_Z_result,ZZ_result,'b','LineWidth',2.4);
% % xlabel('\fontsize{12} \bfrange to go(s)');
% % ylabel('\fontsize{12} \bfcross-range(rad)');
% % legend('Cross-range up edge','Cross-range down edge','Cross-range');
% % grid on;
% 
% % figure(14);
% % plot(S_togo_Z_result,1.1*ZZ_up_result1,'k--',S_togo_Z_result,1.1*ZZ_down_result1,'c--',S_togo_Z_result,ZZ_result1,'b','LineWidth',2.4);
% % xlabel('\fontsize{12} \bfrange to go(s)');
% % ylabel('\fontsize{12} \bfcross-range(rad)');
% % legend('Cross-range up edge','Cross-range down edge','Cross-range');
% % grid on;
% 
%%%%%%%%%%%%%%%%%
% figure(15);
% plot3(lamda_result*180/pi,fai_result*180/pi,H_result,'LineWidth',2.4);
% xlabel('\fontsize{12} \bf经度');
% ylabel('\fontsize{12} \bf纬度');
% zlabel('\fontsize{12} \bf高度');
% grid on;



% figure(16);
% plot3(H_result,V_result,e_result,'LineWidth',2.4);
% grid on;
% %落点半径圆
% %经纬度圆
% 
% figure(17);
% hold on
% %落点半径圆
% %经纬度圆
% Re = 6378145;
% R=10e3;
% Rx=0.09/2;
% Ry=0.09/2;
% a=0:pi/50:(2*pi);
% X=Rx*cos(a)+lamda_final*180/pi;
% Y=Ry*sin(a)+fai_final*180/pi;
% X1=Rx/2*cos(a)+lamda_final*180/pi;
% Y1=Ry/2*sin(a)+fai_final*180/pi;
% P1=plot(lamda_final*180/pi,fai_final*180/pi,'ro');
% P2=plot(X,Y,'k-');
% plot(X1,Y1,'k-');
% grid on;
% P3=plot(lamda*180/pi,fai*180/pi+0.02,'ko','LineWidth',2.4);
% xlabel('\fontsize{12} \bflongitude/deg');
% ylabel('\fontsize{12} \bflatitude/deg');
% legend([P1,P2,P3],'Target Point','Error Range','Real Drop Point');
% grid on;
% 
% % %坐标圆
% % Re = 6378145;
% % R=10e3;
% % a=0:pi/50:(2*pi);
% % X=R*cos(a)+x_final;
% % Y=R*sin(a)+y_final;
% % figure;
% % plot(x_final,y_final,'r.',xf,yf,'ko','LineWidth',2.4);
% % hold on
% % plot(X,Y,'k-');
% % xlabel('\fontsize{12} \bfX');
% % ylabel('\fontsize{12} \bfY');
% % % legend('滑跑段','涡轮段','RBCC段');
% % grid on;
% [n,~]=size(t_result);
% Q_limit=120*ones(n,1);
% Qh_limit=6e2*ones(n,1);
% axisload_limit=10*9.80665*ones(n,1);
% normal_load_limit=5*9.80665*ones(n,1);
% lateral_load_limit=5*9.80665*ones(n,1);
% 
% % 
% % figure(18);
% % plot(t_result,Q_result/1000,'b','LineWidth',2.4);
% % xlabel('\fontsize{12} \bftime');
% % ylabel('\fontsize{12} \bf动压');
% % grid on;
% 
% 
% figure(19);
% plot(t_result,axial_load,'b',t_result,axisload_limit,'r','LineWidth',2.4);
% xlabel('\fontsize{12} \bftime');
% ylabel('\fontsize{12} \bf轴向过载');
% grid on;
% 
% figure(20);
% plot(t_result,nomal_load,'b',t_result,normal_load_limit,'r','LineWidth',2.4);
% xlabel('\fontsize{12} \bftime');
% ylabel('\fontsize{12} \bf法向过载');
% grid on;
% 
% figure(21);
% plot(t_result,lateral_load,'b',t_result,lateral_load_limit,'r','LineWidth',2.4);
% xlabel('\fontsize{12} \bftime');
% ylabel('\fontsize{12} \bf侧向过载');
% grid on;
% 
% % figure(22);
% % plot(t_result,Qh_result,'k','LineWidth',2.4);
% % xlabel(['\fontsize{12}\fontname{宋体}时间\fontname{Times new roman}/s'])
% % ylabel(['\fontsize{12}\fontname{宋体}热流率\fontname{Times new roman}/(J.s^{-1})'])
% % grid on;
% 
% CC_target=sin(pi/2-fai_final)*sin(pi/2-fai)*cos(lamda_final-lamda)+cos(pi/2-fai_final)*cos(pi/2-fai);
% S_target=Re*acos(CC_target)
% 
% 
% 
% 
