close all
clear

for i=11:13
    eval(['load("Missle',num2str(i),'.mat","FlyData")'])
    
    if i==11
        load dataEND_48
    elseif i==12
        load dataEND_49
    elseif i==13
        load dataEND_50
    end
    
    figure(1)
    plot(FlyData(:,1),FlyData(:,2)/1000,'LineWidth',2)
    hold on
    xl = xlabel('$t/s$','Interpreter','latex');
    yl = ylabel('$H/km$','Interpreter','latex');
    set(xl,'FontSize',18);
    set(yl,'FontSize',18);
    grid on;
 
    
    figure(2)
    plot(FlyData(:,1),FlyData(:,3),'LineWidth',2)
    hold on
    xl = xlabel('$t/s$','Interpreter','latex');
    yl = ylabel('$V/(m/s)$','Interpreter','latex');
    set(xl,'FontSize',18);
    set(yl,'FontSize',18);
    grid on;
    
    
    figure(3)
    plot(FlyData(:,1),FlyData(:,7)*180/pi,'LineWidth',1.5);
    hold on
    xl = xlabel('$t/s$','Interpreter','latex');
    yl = ylabel('$\sigma/deg$','Interpreter','latex');
    set(xl,'FontSize',18);
    set(yl,'FontSize',18);
    grid on;
   
    
    figure(4)
    plot(FlyData(:,8)*180/pi,FlyData(:,9)*180/pi,'LineWidth',2);
    hold on
    plot(dataEND(3)*180/pi,dataEND(4)*180/pi,'o','LineWidth',2);
    hold on
    xl = xlabel('$\lambda/deg$','Interpreter','latex');
    yl = ylabel('$\phi/deg$','Interpreter','latex');
%     set(gca,'XTick',60.8:0.2:62);
%     set(gca,'YTick',27.2:0.2:28.8);
    set(xl,'FontSize',18);
    set(yl,'FontSize',18);
    grid on;
%     axis equal;
    
    figure(5)
    plot(FlyData(:,1),FlyData(:,15)*180/pi,'LineWidth',1.5);
    hold on
    xl = xlabel('$t/s$','Interpreter','latex');
    yl = ylabel('$\theta/deg$','Interpreter','latex');
    title('µ¯µÀÇã½Ç');
    set(xl,'FontSize',18);
    set(yl,'FontSize',18);
    grid on;
    
    figure(6)
    plot(FlyData(:,1),FlyData(:,16)*180/pi,'LineWidth',1.5);
    hold on
    xl = xlabel('$t/s$','Interpreter','latex');
    yl = ylabel('$\psi/deg$','Interpreter','latex');
    title('µ¯µÀÆ«½Ç');
    set(xl,'FontSize',18);
    set(yl,'FontSize',18);
    grid on;
   
    figure(7)
    lambda=FlyData(:,8)*180/pi;
    phi=FlyData(:,9)*180/pi;
    h=FlyData(:,2)/1000;
    plot3(lambda,phi,h,'LineWidth',1.5);
    hold on
%     plot3(dataEND(3)*180/pi,dataEND(4)*180/pi,dataEND(2)/1000,'o','LineWidth',2);
%     hold on
    xl = xlabel('$\lambda/deg$','Interpreter','latex');
    yl = ylabel('$\phi/deg$','Interpreter','latex');
    zl = zlabel('$H/km$','Interpreter','latex');
    set(xl,'FontSize',18);
    set(yl,'FontSize',18);
    set(zl,'FontSize',18);
    grid on;
    
    figure(8)
    plot(FlyData(:,3),FlyData(:,6)*180/pi,'LineWidth',1.5);
    hold on
    xl = xlabel('$V/(m/s)$','Interpreter','latex');
    yl = ylabel('$\alpha/deg$','Interpreter','latex');
    set(xl,'FontSize',18);
    set(yl,'FontSize',18);
    grid on;
    
    [j,k]=size(FlyData);
    time(i) = FlyData(j,1);
    error(i) = FlyData(1,k);
end
figure(1)
legend('1ºÅ·ÉÐÐÆ÷','2ºÅ·ÉÐÐÆ÷','3ºÅ·ÉÐÐÆ÷');
figure(2)
legend('1ºÅ·ÉÐÐÆ÷','2ºÅ·ÉÐÐÆ÷','3ºÅ·ÉÐÐÆ÷');
figure(3)
legend('1ºÅ·ÉÐÐÆ÷','2ºÅ·ÉÐÐÆ÷','3ºÅ·ÉÐÐÆ÷');
figure(4) 
legend('1ºÅ·ÉÐÐÆ÷','1ºÅ·ÉÐÐÆ÷ÆÚÍûÎ»ÖÃ','2ºÅ·ÉÐÐÆ÷','2ºÅ·ÉÐÐÆ÷ÆÚÍûÎ»ÖÃ','3ºÅ·ÉÐÐÆ÷','3ºÅ·ÉÐÐÆ÷ÆÚÍûÎ»ÖÃ');
% legend('Missile1','Expected location of Missile1','Missile2','Expected location of Missile2','Missile3','Expected location of Missile3');
figure(5)
legend('1ºÅ·ÉÐÐÆ÷','2ºÅ·ÉÐÐÆ÷','3ºÅ·ÉÐÐÆ÷');
figure(6)
legend('1ºÅ·ÉÐÐÆ÷','2ºÅ·ÉÐÐÆ÷','3ºÅ·ÉÐÐÆ÷');
figure(7)
legend('1ºÅ·ÉÐÐÆ÷','2ºÅ·ÉÐÐÆ÷','3ºÅ·ÉÐÐÆ÷');
figure(8)
legend('1ºÅ·ÉÐÐÆ÷','2ºÅ·ÉÐÐÆ÷','3ºÅ·ÉÐÐÆ÷');
% 
% figure(1)
% legend('Missile1','Missile2','Missile3');
% figure(2)
% legend('Missile1','Missile2','Missile3');
% figure(3)
% legend('Missile1','Missile2','Missile3');
% figure(4) 
% legend('Missile1','Expected location of Missile1','Missile2','Expected location of Missile2','Missile3','Expected location of Missile3');
% figure(5)
% legend('Missile1','Missile2','Missile3');
% figure(6)
% legend('Missile1','Missile2','Missile3');
% figure(7)
% legend('Missile1','Missile2','Missile3');
% figure(8)
% legend('Missile1','Missile2','Missile3');








