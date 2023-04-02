% close all
% clear


% plot(YcLm,XcLm,'r','LineWidth',2); 
% hold on
h6=plot(YLm/d,XLm/d,'b','LineWidth',2,'DisplayName','Real road'); 
xlabel('\fontsize{12} \bfY (百公里)');
ylabel('\fontsize{12} \bfX (百公里)');
% legend(h3,'起点','Location','NorthEastOutside');
% legend('Location','NorthEastOutside');
hold off


figure(2)
plot(tm,Vxm,'b','LineWidth',2); 
xlabel('\fontsize{12} \bft (s)');
ylabel('\fontsize{12} \bfVx (m/s)');
% legend('real road','best road','Location','NorthEastOutside');

figure(3)
plot(tm,Vym,'b','LineWidth',2); 
xlabel('\fontsize{12} \bft (s)');
ylabel('\fontsize{12} \bfVy (m)');
% legend('real road','best road','Location','NorthEastOutside');

figure(13)
plot(tm,VLm,'b','LineWidth',2); 
xlabel('\fontsize{12} \bft (s)');
ylabel('\fontsize{12} \bfV (m/s)');

figure(14)
plot(tm,kLm/pi*180,'b','LineWidth',2); 
xlabel('\fontsize{12} \bft (s)');
ylabel('\fontsize{12} \bfkL (deg)');

figure(4)
plot(tm,axm,'b','LineWidth',2); 
xlabel('\fontsize{12} \bft (s)');
ylabel('\fontsize{12} \bfax (m/s^2)');
% legend('real road','best road','Location','NorthEastOutside');

figure(5)
plot(tm,aym,'y','LineWidth',2); 
xlabel('\fontsize{12} \bft (s)');
ylabel('\fontsize{12} \bfay (m/s^2)');
% legend('real road','best road','Location','NorthEastOutside');

figure(6)
plot(tm,eXLm/d,'b','LineWidth',2); 
hold on
plot(tm,ec,'m','LineWidth',1.5); 
xlabel('\fontsize{12} \bft (s)');
ylabel('\fontsize{12} \bfeX (百公里)');
hold off
legend('eX','Location','NorthEastOutside');
% 
figure(7)
plot(tm,XLm/d,'b','LineWidth',2); 
hold on
plot(tm,XcLm/d,'m','LineWidth',1.5); 
xlabel('\fontsize{12} \bft (s)');
ylabel('\fontsize{12} \bfX (百公里)');
legend('real road','best road','Location','NorthEastOutside');
hold off
% 

% 
% 
figure(9)
plot(tm,eYLm/d,'b','LineWidth',2); 
hold on
plot(tm,ec,'m','LineWidth',1.5); 
xlabel('\fontsize{12} \bft (s)');
ylabel('\fontsize{12} \bfeY (m)');
hold off
% legend('eY','Location','NorthEastOutside');

figure(8)
plot(tm,YLm/d,'b','LineWidth',2); 
hold on
plot(tm,YcLm/d,'m','LineWidth',1.5); 
xlabel('\fontsize{12} \bft (s)');
ylabel('\fontsize{12} \bfY (m)');
legend('real road','best road','Location','NorthEastOutside');
hold off







