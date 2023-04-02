
clc;
clear;
load Data_Road.mat


p1=flipud(p)*d;
XXcL=reX(p1);
YYcL=reY(p1);
ppp(:,1)=XXcL;
ppp(:,2)=YYcL;
m=length(ppp);

% for i=(m+1):100
% pp(i,:)=pp(m,:);
% end
%%%%%% 参数定义 %%%%%%

% t：飞行时间
% h：仿真步长
% L：长机；
% W：僚机；

% XL: 惯性系下，L在x方向坐标
% YL: 惯性系下，L在y方向坐标

% XcL: 航迹要求的L在惯性系下的X值;
% YcL: 航迹要求的L在惯性系下的Y值;

% kL: L的速度与X轴夹角，即航向角
% VL：L的速度大小；
%eL: 误差=[XL-XcL;YL-YcL];


%%%%%% 常数及初始状态 %%%%%%



t0 = 0;
g=9.8;

XL0=ppp(1,1);  
YL0=ppp(1,2);
XcL0=ppp(1,1);  
YcL0=ppp(1,2);

VL0=1.804*1000;        %(m/s)  
kL0=135/180*pi;        %(rad)
Vx0=VL0*cos(kL0);
Vy0=VL0*sin(kL0);

%%%%%% 建立初始状态空间 %%%%%%

t_result = ones(100000,1);
XL_result = ones(100000,1);
YL_result = ones(100000,1);
VL_result = ones(100000,1);
Vx_result = ones(100000,1);
Vy_result = ones(100000,1);
kL_result = ones(100000,1);
VLdot_result = ones(100000,1);
kLdot_result = ones(100000,1);

XcL_result = ones(100000,1);
YcL_result = ones(100000,1);
eXL_result = ones(100000,1);
eYL_result = ones(100000,1);
ax_result = ones(100000,1);
ay_result = ones(100000,1);
av_result = ones(100000,1);
av1_result = ones(100000,1);
eXLdot_result = ones(100000,1);
eYLdot_result = ones(100000,1);
jifen_eXL_result = ones(100000,1);
jifen_eYL_result = ones(100000,1);
h_result = ones(100000,1);
%%%%%% 状态赋初值 %%%%%%

t=t0;

XL=XL0;  
YL=YL0;
XcL=XcL0; 
YcL=YcL0; 
VL=VL0;
Vx=Vx0;        %(m/s)  
Vy=Vy0;
kL=kL0;
jifen_eXL=0;
jifen_eYL=0;
    eXL=XL-XcL;
    eYL=YL-YcL;
    



i=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 while  i<m
     
     t
     
    t_result(i,1) = t;
    
    XLdot=Vx;
    YLdot=Vy;
    
    
    XcL=ppp(i,1);YcL=ppp(i,2);
    eXL=XL-XcL
    eYL=YL-YcL
    
   if XcL==ppp(i+1,1)
       h=d/10/VL0;
%         XcLdot=0;
%         YcLdot=VL0;
    elseif YcL==ppp(i+1,2)
        h=d/10/VL0;
   else
       h=sqrt(2)*d/10/VL0;
   end
    
       XcLdot=(1/h)*(ppp(i+1,1)-ppp(i,1));
    YcLdot=(1/h)*(ppp(i+1,2)-ppp(i,2));
    
    h_result(i,1) = h;
    
    XL_result(i,1) = XL;
    YL_result(i,1) = YL;
    XcL_result(i,1) = XcL;
    YcL_result(i,1) = YcL;
    eXL_result(i,1) = eXL;
    eYL_result(i,1) = eYL;
    
    Vx_result(i,1) = Vx;
    Vy_result(i,1) = Vy;
    VL_result(i,1) = VL;
    kL_result(i,1) =kL;
    
    %%%%%%%%%%%%%%%  长机   %%%%%%%%%%%%%%%%%%%%%%%%%%    
    eXLdot=XLdot-XcLdot;
    eYLdot=YLdot-YcLdot;
    eXLdot_result(i,1) = eXLdot;
    eYLdot_result(i,1) = eYLdot;
    jifen_eXL_result(i,1) = jifen_eXL;
    jifen_eYL_result(i,1) = jifen_eYL;
    %%%%  PID控制 u=[ax;ay]  %%%%%%%%%%%%
%     kdLX=10.5;
%     kpLX=4;
%     kiLX=1.5;

%       kpLX=200/d;
%       kdLX=kpLX*150;
% kiLX=kpLX*20e-3;
      kpLX=150/d;
      kdLX=kpLX*30;
    kiLX=kpLX*5e-3;
    uLX=-kpLX*eXL-kiLX*(jifen_eXL)-kdLX*eXLdot
   
%     kpLY=8;
%     kdLY=12;
%     kiLY=0.5;

     kpLY=150/d;
     kdLY=kpLY*50;
    kiLY=kpLY*5e-3;
     uLY=-kpLY*eYL-kiLY*(jifen_eYL)-kdLY*eYLdot
     
     
%     uL=DL*(kpL*[(XL-XcL);(YL-YcL)]+kdL*[XLdot;YLdot]);
    ax=uLX;
    ay=uLY;
    if ax>35
        ax=35;
    elseif ax<-35
        ax=-35;
    end
    
    if ay>35
        ay=35;
    elseif ay<-35
        ay=-35;
    end
    
    ax_result(i,1) = ax;
    ay_result(i,1) = ay;
    %%%%%%%%%%%%%%%%%%%%%
    av=ax*cos(kL)+ay*sin(kL);
     av1=ax*sin(kL)-ay*cos(kL);
     VLdot=av;
     kLdot=av1/VL;
     VLdot_result(i,1) = VLdot;
    kLdot_result(i,1) = kLdot;
      %%%%%%%%%%%%%%%%%   无人机运动模型（横向）%%%%%%%%%%%%%%%%%%%%%%%%
   
      %质点运动学模型
      Vxdot=ax;
      Vydot=ay;
      XLdot=Vx;
      YLdot=Vy;
      jifen_eXLdot=XL-XcL;
      jifen_eYLdot=YL-YcL;
    
       %%%%%%%%%%%%%%%%%%   欧拉法积分 %%%%%%%%%%%
      Vx=Vx+Vxdot*h;
      Vy=Vy+Vydot*h;
      XL=XL+XLdot*h;
      YL=YL+YLdot*h;
      jifen_eXL=jifen_eXL+jifen_eXLdot*h;
      jifen_eYL=jifen_eYL+jifen_eYLdot*h;
     kL=atan(Vy/Vx);
     VL=sqrt(Vx^2+Vy^2);
     
      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    t = t+h;
    i = i+1;
    
 end
  i_1 = i - 1;

tm = t_result(1:i_1);
hm = h_result(1:i_1);
XLm= XL_result(1:i_1);
YLm= YL_result(1:i_1);
llamL=tolam(d,YLm);
ffaiL=tofai(d,XLm);
Vxm= Vx_result(1:i_1);
Vym= Vy_result(1:i_1);
VLm= VL_result(1:i_1);
axm= ax_result(1:i_1);
aym= ay_result(1:i_1);
kLm= kL_result(1:i_1);
VLdotm=VLdot_result(1:i_1);
kLdotm=kLdot_result(1:i_1);
XcLm= XcL_result(1:i_1);
YcLm= YcL_result(1:i_1);
eXLm= eXL_result(1:i_1);
eYLm= eYL_result(1:i_1);
eXLdotm= eXLdot_result(1:i_1);
eYLdotm= eYLdot_result(1:i_1);
jifen_eXLm= jifen_eXL_result(1:i_1);
jifen_eYLm= jifen_eYL_result(1:i_1);
l=size(eXLm);
ec=zeros(l);
save data0519
nxWnyW0525;
% plot_Bestroad;