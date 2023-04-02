close all;
load datad.mat
% load Data_result4.mat
% load Data_result5.mat
% load cc0.mat
% load cc1.mat
% load cc2.mat
% load cc3.mat

figure(10);
% plot3(lamc,faic,Hc/1000,'k*','LineWidth',2); 
% hold on
% plot3(lam11,fai11,H11/1000,'r','LineWidth',1.5); 
% hold on
% plot3(lam22,fai22,H22/1000,'m','LineWidth',1.5); 
% hold on
% plot3(lam33,fai33,H33/1000,'g','LineWidth',1.5); 
% hold on
plot3(lamLn,faiLn,Hn/1000,'r+','LineWidth',2); 
hold on
plot3(lamW1n,faiW1n,Hn/1000,'ms','LineWidth',2); 
hold on
plot3(lamW2n,faiW2n,Hn/1000,'gs','LineWidth',2); 
hold on
% plot(YW3n/1000,XW3n/1000,'bs','LineWidth',2); 
% hold on
plot3(llamL,ffaiL,Hm/1000,'r:','LineWidth',1.5); 
hold on
plot3(llamW1,ffaiW1,Hm/1000,'m:','LineWidth',1.5); 
hold on
plot3(llamW2,ffaiW2,Hm/1000,'g:','LineWidth',1.5); 
hold on

load Data_Road.mat
HF=[26:0.1:30]';
hl=length(HF);
for o=1:hl
plot3(lamF1,faiF*ones(size(lamF1)),HF(o),'k.');
hold on
plot3(lamF2,faiF*ones(size(lamF2)),HF(o),'k.');
hold on
plot3(lamF*ones(size(faiF1)),faiF1,HF(o),'k.');
hold on
plot3(lamF*ones(size(faiF2)),faiF2,HF(o),'k.');
end
xlabel('\fontsize{12} \bfλ/°');
ylabel('\fontsize{12} \bfφ/°');
zlabel('\fontsize{12} \bfH/km');
legend('leader','follower1','follower2','Location','SouthEast');
grid on;
hold off
axis equal;


figure(1)
plot(lamF1,faiF*ones(size(lamF1)),'k.');
hold on
plot(lamF2,faiF*ones(size(lamF2)),'k.');
hold on
plot(lamF*ones(size(faiF1)),faiF1,'k.');
hold on
plot(lamF*ones(size(faiF2)),faiF2,'k.');
plot(lamLn,faiLn,'r+','LineWidth',2); 
hold on
plot(lamW1n,faiW1n,'ms','LineWidth',2); 
hold on
plot(lamW2n,faiW2n,'gs','LineWidth',2); 
hold on
plot(lamW3n,faiW3n,'bs','LineWidth',2);
hold on
plot(llamL,ffaiL,'r:','LineWidth',1.5); 
hold on
plot(llamW1,ffaiW1,'m:','LineWidth',1.5); 
hold on
plot(llamW2,ffaiW2,'g:','LineWidth',1.5);
hold on
plot(llamW3,ffaiW3,'b:','LineWidth',1.5); 
xlabel('\fontsize{12} \bfλ/°');
ylabel('\fontsize{12} \bfφ/°');
% legend('leader','follower1','follower2','Location','SouthEast');
grid on;
hold off
axis equal;


figure(2);
plot(tm,VLm,'r','LineWidth',2); 
hold on
plot(tm,VW1m,'m','LineWidth',2); 
hold on
plot(tm,VW2m,'g','LineWidth',2); 
% hold on
% plot(tm,VW3m,'b','LineWidth',2); 
xlabel('\fontsize{12} \bft (s)');
ylabel('\fontsize{12} \bfV (m/s)');
legend('leader','follower1','follower2','Location','SouthEast');
grid on;
hold off

figure(12);
plot(tm,X1m,'r','LineWidth',2); 
hold on
plot(tm,Xc1m,'m','LineWidth',2); 
xlabel('\fontsize{12} \bft (s)');
ylabel('\fontsize{12} \bfX1');

figure(13);
plot(tm,Y1m,'r','LineWidth',2); 
hold on
plot(tm,Yc1m,'m','LineWidth',2); 
xlabel('\fontsize{12} \bft (s)');
ylabel('\fontsize{12} \bfY1');

figure(14);
plot(tm,X2m,'r','LineWidth',2); 
hold on
plot(tm,Xc2m,'m','LineWidth',2); 
xlabel('\fontsize{12} \bft (s)');
ylabel('\fontsize{12} \bfX2');

figure(15);
plot(tm,Y2m,'r','LineWidth',2); 
hold on
plot(tm,Yc2m,'m','LineWidth',2); 
xlabel('\fontsize{12} \bft (s)');
ylabel('\fontsize{12} \bfY2');

figure(3);
plot(tm,kLLm,'r','LineWidth',2); 
hold on
plot(tm,kWW1m,'m','LineWidth',2); 
hold on
plot(tm,kWW2m,'g','LineWidth',2); 
% hold on
% plot(tm,kWW3m,'b','LineWidth',2); 
xlabel('\fontsize{12} \bft (s)');
ylabel('\fontsize{12} \bf ψ (°)');
legend('leader','follower1','follower2','Location','NorthEast');
grid on;
hold off

figure(4);
plot(tm,rcm/1000,'r','LineWidth',2); 
hold on
plot(tm,r1m/1000,'m','LineWidth',2); 
hold on
plot(tm,r2m/1000,'g','LineWidth',2); 
plot(tm,r3m/1000,'c','LineWidth',2); 
% hold on
% plot(tm,r3m/1000,'b','LineWidth',2); 
xlabel('\fontsize{12} \bft (s)');
ylabel('\fontsize{12} \bfr (km)');
legend('rc','rL-W1','rL-W2','rL-W3','Location','NorthEast');
grid on;
hold off

figure(5);
plot(tm,f11m,'r','LineWidth',2); 
hold on
plot(tm,fc1m,'k','LineWidth',2); 
xlabel('\fontsize{12} \bft (s)');
ylabel('\fontsize{12} \bfφ1 (°)');
legend('实际L-W1连线与惯性系Y轴夹角φ1','队形要求L-W1连线与惯性系Y轴夹角φ1c');
grid on;
hold off

figure(6);
plot(tm,f22m,'r','LineWidth',2); 
hold on
plot(tm,fc2m,'k','LineWidth',2); 
xlabel('\fontsize{12} \bft (s)');
ylabel('\fontsize{12} \bfφ2(°）');
legend('实际L-W2连线与惯性系Y轴夹角φ2','队形要求L-W2连线与惯性系Y轴夹角φ2c');
grid on;
hold off

% figure(7);
% plot(tm,f33m,'r','LineWidth',2); 
% hold on
% plot(tm,fc3m,'k','LineWidth',2); 
% xlabel('\fontsize{12} \bft (s)');
% ylabel('\fontsize{12} \bfφ3(°）');
% legend('实际L-W3连线与惯性系Y轴夹角φ3','队形要求L-W3连线与惯性系Y轴夹角φ3c');
% grid on;
% hold off

figure(7);
plot(tm,theta1m,'r','LineWidth',2); 
hold on
plot(tm,theta2m,'b--','LineWidth',2); 
hold on
plot(tm,theta3m,'c','LineWidth',2); 
xlabel('\fontsize{12} \bft (s)');
ylabel('\fontsize{12} \bftehta(°）');
legend('1号从机与主机角度','2号从机与主机角度','3号从机与主机角度');
grid on;
hold off

figure(8);
plot(tm,nxW1m,'m','LineWidth',2); 
hold on
plot(tm,nxW2m,'g','LineWidth',2); 
% hold on
% plot(tm,nxW3m,'b','LineWidth',2); 
xlabel('\fontsize{12} \bft (s)');
ylabel('\fontsize{12} \bfnx ');
legend('follower1','follower2','Location','NorthEast');
grid on;
hold off

figure(9);
plot(tm,nyW1m,'m','LineWidth',2); 
hold on
plot(tm,nyW2m,'g','LineWidth',2); 
% hold on
% plot(tm,nyW3m,'b','LineWidth',2); 
xlabel('\fontsize{12} \bft (s)');
ylabel('\fontsize{12} \bfnz ');
legend('follower1','follower2','Location','NorthEast');
grid on;
hold off

figure(11);
plot(XLn,YLn,'r+','LineWidth',2); 
hold on
plot(XW1n,YW1n,'ms','LineWidth',2); 
hold on
plot(XW2n,YW2n,'gs','LineWidth',2); 
hold on
plot(XW3n,YW3n,'bs','LineWidth',2); 
hold on
plot(XLm,YLm,'r:','LineWidth',1.5); 
hold on
plot(XW1m,YW1m,'m:','LineWidth',1.5); 
hold on
plot(XW2m,YW2m,'g:','LineWidth',1.5);
hold on
plot(XW3m,YW3m,'b:','LineWidth',1.5); 
xlabel('\fontsize{12} \bfX');
ylabel('\fontsize{12} \bfY');
% legend('leader','follower1','follower2','Location','SouthEast');
grid on;
hold off
axis equal;