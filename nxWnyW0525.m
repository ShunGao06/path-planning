%%%%%% 参数定义 %%%%%%

% t：飞行时间
% h：仿真步长
% L：长机；
% W：僚机；

% Xi: 惯性系下，x方向坐标（i=L W1 W2 W3）；
% Yi: 惯性系下，y方向坐标（i=L W1 W2 W3）；
% mi: 长机体轴系下，x方向坐标（i=L W1 W2 W3）；
% ni: 长机体轴系下，y方向坐标（i=L W1 W2 W3）；

% Xi=XL-XWi;(i=1 2 3);
% Yi=YL-YWi;
% mi=mL-mWi;
% ni=nL-nWi;

% Xci: 队形要求的惯性系下XL-XWi;
% Yci: 队形要求的惯性系下YL-YWi;
% mci: 队形要求的长机体轴系下mL-mWi;
% nci: 队形要求的长机体轴系下nL-nWi;
% 当队形一定时，mci nci为定值，不随时间变化；但Xci Yci不是定值，[Xci Yci]'=T(kL)*[mci nci]',取决于kL随时间的变化;

% ki: 速度与X轴夹角，即航向角（i=L W1 W2 W3）；
% Vi：速度大小；（i=L W1 W2 W3）；
% kic/Vic: 为保持队形，此刻要求的航向角/速度大小；

% r:长机与僚机之间的距离；
% fi: 长机与僚机的连线与m轴正方向夹角，规定从连线到m正方向顺时针旋转为正；（i=1 2 3）（rad）
% fii: 单位度


% lv:速度时间常数的倒数；
% lk:航向角时间常数的倒数；

%e[]: 误差=[X-Xc;Y-Yc];


%%%%%% 常数及初始状态 %%%%%%

close all;

clear;

load data0519.mat

t0 = 0;
%---------------------------------------------------------------------------
% H0=handles.H0; % 巡航高度28km
% Mach=handles.Mach;  % 巡航速度马赫6
% V=AirSpeedCal(H0)*Mach;
%---------------------------------------------------------------------------
H0=28; % 巡航高度28km
Mach=6;  % 巡航速度马赫6
V=AirSpeedCal(H0)*Mach;

lamm02=124.88; Hm02=28; faim02=37.58;  % follower1
lamm03=124.77; Hm03=28; faim03=37.45;  % follower2
lamm04=124.66; Hm04=28; faim04=37.35;  % follower3
lamc=121.57;    Hc=0;            faic=38.93;  % 起点：大连

%---------------------------------------------------------------------------
% lamm02=handles.lam02; Hm02=handles.H0; faim02=handles.fai02;  % follower1
% lamm03=handles.lam03; Hm03=handles.H0; faim03=handles.fai03;  % follower2
% lamc=handles.lam0;    Hc=0;            faic=handles.fai0;  % 起点：大连
%---------------------------------------------------------------------------

XW10=lam2xyz(lamm02); ym02=Hm02; YW10=lam2xyz(faim02);
XW20=lam2xyz(lamm03); ym03=Hm03; YW20=lam2xyz(faim03);
XW30=lam2xyz(lamm04); ym04=Hm04; YW30=lam2xyz(faim04);

llamL=rexhk(llamL)+0.09;
ffaiL=rexhk(ffaiL)-0.09-0.1;
lamm01=llamL(1); Hm01=28; faim01=ffaiL(1); % leader

hm=rexhk(hm);
hm=(hm)/30;
VLm=rexhk(VLm);
kLm=rexhk(kLm);
VLdotm=rexhk(VLdotm);
kLdotm=rexhk(kLdotm);
XLm=lam2xyz(llamL);  
YLm=lam2xyz(ffaiL);
XLm=[XLm;XLm(end)];
YLm=[YLm;YLm(end)];
VLm=[VLm;VLm(end)];
kLm=-(kLm+pi/2);
kLm=[kLm;kLm(end)];
% kLm=[kLm;kLm(end)];
hm=[hm;hm(end)];
m=length(hm);

%%出发点的速度以及航向角
VL0=V;        %(m/s)  
kL0=-45/180*pi; %(rad)
VW10=V;        %(m/s)  
kW10=-45/180*pi; %(rad)
VW20=V;        %(m/s)  
kW20=-45/180*pi; %(rad)
VW30=V;        %(m/s)  
kW30=-45/180*pi; %(rad)

rc=2000;
mc10=rc*cos(120/180*pi);
nc10=rc*sin(120/180*pi);
mc20=rc*cos(-120/180*pi);
nc20=rc*sin(-120/180*pi);
mc30=rc;
nc30=0;

%%%%%% 建立初始状态空间 %%%%%%

t_result = ones(100000,1);

rc_result = ones(100000,1);
r1_result = ones(100000,1);
r2_result = ones(100000,1);
r3_result = ones(100000,1);
r4_result = ones(100000,1);


XL_result = ones(100000,1);
YL_result = ones(100000,1);
XW1_result = ones(100000,1);
YW1_result = ones(100000,1);
XW2_result = ones(100000,1);
YW2_result = ones(100000,1);
XW3_result = ones(100000,1);
YW3_result = ones(100000,1);
nxW1_result = ones(100000,1);
nyW1_result = ones(100000,1);
nxW2_result = ones(100000,1);
nyW2_result = ones(100000,1);
nxW3_result = ones(100000,1);
nyW3_result = ones(100000,1);

VL_result = ones(100000,1);
kL_result = ones(100000,1);
kLL_result = ones(100000,1);
VW1_result = ones(100000,1);
kW1_result = ones(100000,1);
kWW1_result = ones(100000,1);
VW2_result = ones(100000,1);
kW2_result = ones(100000,1);
kWW2_result = ones(100000,1);
VW3_result = ones(100000,1);
kW3_result = ones(100000,1);
kWW3_result = ones(100000,1);

X1_result = ones(100000,1);
Y1_result = ones(100000,1);
Xc1_result = ones(100000,1);
Yc1_result = ones(100000,1);
X2_result = ones(100000,1);
Y2_result = ones(100000,1);
Xc2_result = ones(100000,1);
Yc2_result = ones(100000,1);
X3_result = ones(100000,1);
Y3_result = ones(100000,1);
Xc3_result = ones(100000,1);
Yc3_result = ones(100000,1);

eX1_result = ones(100000,1);
eY1_result = ones(100000,1);
eX2_result = ones(100000,1);
eY2_result = ones(100000,1);
eX3_result = ones(100000,1);
eY3_result = ones(100000,1);
ec_result = ones(100000,1);

llammL_result = ones(50000,1);
HHmL_result = ones(50000,1);
ffaimL_result = ones(50000,1);
llamm1_result = ones(50000,1);
HHm1_result = ones(50000,1);
ffaim1_result = ones(50000,1);
llamm2_result = ones(50000,1);
HHm2_result = ones(50000,1);
ffaim2_result = ones(50000,1);
llamm3_result = ones(50000,1);
HHm3_result = ones(50000,1);
ffaim3_result = ones(50000,1);
%%%%%% 状态赋初值 %%%%%%

t=t0;

XL=XLm(1); 
YL=YLm(1);
XW1=XW10;  
YW1=YW10;
XW2=XW20;  
YW2=YW20;
XW3=XW30;  
YW3=YW30;

VL=VL0;        %(m/s)  
kL=kL0;        %(rad)
VW1=VW10;       %(m/s)  
kW1=kW10;      %(rad)
VW2=VW20;       %(m/s)  
kW2=kW20;      %(rad)
VW3=VW30;       %(m/s)  
kW3=kW30;      %(rad)
jifen_eX1=0;
jifen_eY1=0;
jifen_eX2=0;
jifen_eY2=0;
jifen_eX3=0;
jifen_eY3=0;

% 目标编队

T=[cos(-kL+pi/2) -sin(-kL+pi/2);sin(-kL+pi/2) cos(-kL+pi/2)];
% % T=[cos(kL) sin(kL);sin(kL) cos(kL)];
% 
% c1=T*[mc10;nc10];
%  Yc1=c1(1);  % -3.4730
%  Xc1=c1(2);  % 19.6962
%  fc1=atan(Xc1/Yc1)/pi*180;      % 度
%  
%  c2=T*[mc20;nc20];
%  Yc2=c2(1);  % 18.7939
%  Xc2=c2(2);  %-6.8404
%  fc2=atan(Xc2/Yc2)/pi*180;      % 度
 
 ec=0;

g=9.8;

i=1;
a=0;
 h=hm(i);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 while  i<m
     
     t
     
     VLdot=VLdotm(i);
     kLdot=-kLdotm(i);

 
     if kL>2*pi
         kL=kL-2*pi;
     elseif kL<-2*pi
         kL=kL+2*pi;
     end
     if kW1>2*pi
         kW1=kW1-2*pi;
     elseif kW1<-2*pi
         kW1=kW1+2*pi;
     end
     if kW2>2*pi
         kW2=kW2-2*pi;
     elseif kW2<-2*pi
         kW2=kW2+2*pi;
     end
     if kW3>2*pi
         kW3=kW3-2*pi;
     elseif kW3<-2*pi
         kW3=kW3+2*pi;
     end
     kLL=kL/pi*180;
     kWW1=kW1/pi*180;
     kWW2=kW2/pi*180;
     kWW3=kW3/pi*180;
     
     %%%%%%%%%%%%
    t_result(i,1) = t;
    
    XL_result(i+a*10,1) = XL;
    YL_result(i+a*10,1) = YL;
    XW1_result(i+a*10,1) = XW1;
    YW1_result(i+a*10,1) = YW1;
    XW2_result(i+a*10,1) = XW2;
    YW2_result(i+a*10,1) = YW2;
    XW3_result(i+a*10,1) = XW3;
    YW3_result(i+a*10,1) = YW3;

    
    VL_result(i) = VL;
    kL_result(i) = kL;
    kLL_result(i) = kLL;   %(°)
    
    VW1_result(i) = VW1;
    kW1_result(i) = kW1;
    kWW1_result(i) = kWW1;   %(°)
    
    VW2_result(i) = VW2;
    kW2_result(i) = kW2;
    kWW2_result(i) = kWW2;   %(°)
    
    VW3_result(i) = VW3;
    kW3_result(i) = kW3;
    kWW3_result(i) = kWW3;   %(°)
    
    
    T=[cos(-kL+pi/2) -sin(-kL+pi/2);sin(-kL+pi/2) cos(-kL+pi/2)];
% T=[cos(kL) sin(kL);sin(kL) cos(kL)];

 %—————————导弹控制位置误差值坐标转换，得到的是/期望的坐标差/，然后得到地面坐标系角度
 c1=T*[mc10;nc10];
 Yc1=c1(1);  % -3.4730
 Xc1=c1(2);  % 19.6962
 fc1=atan(Xc1/Yc1)/pi*180;      % 度
 
 c2=T*[mc20;nc20];
 Yc2=c2(1);  % 18.7939
 Xc2=c2(2);  %-6.8404
 fc2=atan(Xc2/Yc2)/pi*180;      % 度
 
 c3=T*[mc30;nc30];
 Yc3=c3(1);  
 Xc3=c3(2);  
 fc3=atan(Xc3/Yc3)/pi*180;      % 度
 
 T_1=[cos(-kL+pi/2) sin(-kL+pi/2);-sin(-kL+pi/2) cos(-kL+pi/2)];
    
    X1=XL-XW1;%这是真实的位置坐标差值
    Y1=YL-YW1;
    X2=XL-XW2;
    Y2=YL-YW2;
    X3=XL-XW3;
    Y3=YL-YW3;

    eX1=X1-Xc1;%这是真实的位置的偏差值，控制这个
    eX2=X2-Xc2;
    eX3=X3-Xc3;
    eY1=Y1-Yc1;
    eY2=Y2-Yc2;
    eY3=Y3-Yc3;

   
    mn1=T_1*[X1;Y1];
    m1=mn1(1);
    n1=mn1(2);
    
    mn2=T_1*[X2;Y2];
    m2=mn1(1);
    n2=mn1(2);
    
    mn3=T_1*[X3;Y3];
    m3=mn3(1);
    n3=mn3(2);

    %求在地面坐标系下的/真实的/从机和主机的距离和角度
    r1=sqrt(X1^2+Y1^2);
    f1=atan(X1/Y1);     % rad
    f11=f1/pi*180;      % 度
    
    r2=sqrt(X2^2+Y2^2);
    f2=atan(X2/Y2);  % rad
    f22=f2/pi*180;      % 度

    r3=sqrt(X3^2+Y3^2);
    f3=atan(X3/Y3);  % rad
    f33=f3/pi*180;      % 度
    %%旋转坐标系下的编队真实角度
    
    
    theta1=atan(n1/m1)*180/pi;
    theta1c=60;
    theta2=atan(n2/m2)*180/pi;
    theta2c=60;
    theta3=atan(n3/m3)*180/pi;
    theta3c=0;
    
    
    %%%%%%%%%%%%%真实坐标差值/期望坐标差值/真实偏差值
    X1_result(i) = X1;
    Y1_result(i) = Y1;
    Xc1_result(i) = Xc1;
    Yc1_result(i) = Yc1;
    eX1_result(i) = eX1;
    eY1_result(i) = eY1;
    theta1_result(i)=theta1;
    
    X2_result(i) = X2;
    Y2_result(i) = Y2;
    Xc2_result(i) = Xc2;
    Yc2_result(i) = Yc2;
    eX2_result(i) = eX2;
    eY2_result(i) = eY2;
    theta2_result(i)=theta2;
    
    X3_result(i) = X3;
    Y3_result(i) = Y3;
    Xc3_result(i) = Xc3;
    Yc3_result(i) = Yc3;
    eX3_result(i) = eX3;
    eY3_result(i) = eY3;
    theta3_result(i)=theta3;

    ec_result(i) = ec;%%期望的偏差值
    
    rc_result(i) = rc;%%期望的距离
    
    r1_result(i) = r1;
    f11_result(i) = f11;
    fc1_result(i) = fc1;
    
    r2_result(i) = r2;
    f22_result(i) = f22;
    fc2_result(i) = fc2;
    
    r3_result(i) = r3;
    f33_result(i) = f33;
    fc3_result(i) = fc3;

    %%%%%%%%%%%%%%%
    
    
  
    %%%%%%%%%%%%%%%  1号僚机   %%%%%%%%%%%%%%%%%%%%%%%%%%
    T1=[cos(kW1) -sin(kW1);sin(kW1) cos(kW1)];
    D1=inv(g*T1);
    H1=[VLdot*cos(kL)-VL*sin(kL)*kLdot;VLdot*sin(kL)+VL*cos(kL)*kLdot];
    
    X1dot=VL*cos(kL)-VW1*cos(kW1);
    Y1dot=VL*sin(kL)-VW1*sin(kW1);
    
    
    %%%%  PID控制 [VWc;kWc]  %%%%%%%%%%%%
    

%     kp1=handles.kp; kd1=handles.kd;
%     kp1=0.015; kd1=0.45;
 kp1=0.02; kd1=1;
        u1=D1*(H1+kp1*[(X1-Xc1);(Y1-Yc1)]+kd1*[X1dot;Y1dot]);

    if u1(1)>3.5
        u1(1)=3.5;
    elseif u1(1)<-3.5
        u1(1)=-3.5;
    end
    
    if u1(2)>3.5
        u1(2)=3.5;
    elseif u1(2)<-3.5
        u1(2)=-3.5;
    end
    
    nxW1=u1(1);
    nyW1=u1(2);
    

    %%%%%%%%%%%%%%%%%%%%%
    nxW1_result(i) = nxW1;
    nyW1_result(i) = nyW1;
    %%%%%%%%%%%%%%%%%%%%%
    
      %%%%%%%%%%%%%%%%%   无人机运动模型（横向）%%%%%%%%%%%%%%%%%%%%%%%%
    
      %质点运动学模型
      
      VW1dot=g*nxW1;
      kW1dot=g*nyW1/VW1;
      XW1dot=VW1*cos(kW1);
      YW1dot=VW1*sin(kW1);

      %%%%%%%%%%%%%%%%%%   欧拉法积分 %%%%%%%%%%%
      
      VW1=VW1+VW1dot*h;
      kW1=kW1+kW1dot*h;
      XW1=XW1+XW1dot*h;
      YW1=YW1+YW1dot*h;
      
      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      
      
     %%%%%%%%%%%%%%%  2号僚机   %%%%%%%%%%%%%%%%%%%%%%%%%%
    T2=[cos(kW2) -sin(kW2);sin(kW2) cos(kW2)];
    D2=inv(g*T2);
    H2=[VLdot*cos(kL)-VL*sin(kL)*kLdot;VLdot*sin(kL)+VL*cos(kL)*kLdot];
    
    X2dot=VL*cos(kL)-VW2*cos(kW2);
    Y2dot=VL*sin(kL)-VW2*sin(kW2);
    
    
    %%%%  PID控制 [VWc;kWc]  %%%%%%%%%%%%
     

%     kp2=handles.kp; kd2=handles.kd;
%     kp2=0.015; kd2=0.45;
 kp2=0.02; kd2=1;
        u2=D2*(H2+kp2*[(X2-Xc2);(Y2-Yc2)]+kd2*[X2dot;Y2dot]);

    if u2(1)>3.5
        u2(1)=3.5;
    elseif u2(1)<-3.5
        u2(1)=-3.5;
    end

    if u2(2)>3.5
        u2(2)=3.5;
    elseif u2(2)<-3.5
        u2(2)=-3.5;
    end
    nxW2=u2(1);
    nyW2=u2(2);
    %%%%%%%%%%%%%%%%%%%%%
    nxW2_result(i)= nxW2;
    nyW2_result(i) = nyW2;
    %%%%%%%%%%%%%%%%%%%%%
    
      %%%%%%%%%%%%%%%%%   无人机运动模型（横向）%%%%%%%%%%%%%%%%%%%%%%%%
    
      %质点运动学模型
      
      VW2dot=g*nxW2;
      kW2dot=g*nyW2/VW2;
      XW2dot=VW2*cos(kW2);
      YW2dot=VW2*sin(kW2);
      %%%%%%%%%%%%%%%%%%   欧拉法积分 %%%%%%%%%%%
      
      VW2=VW2+VW2dot*h;
      kW2=kW2+kW2dot*h;
      XW2=XW2+XW2dot*h;
      YW2=YW2+YW2dot*h;
      
      
      
           %%%%%%%%%%%%%%%  3号僚机   %%%%%%%%%%%%%%%%%%%%%%%%%%
    T3=[cos(kW3) -sin(kW3);sin(kW3) cos(kW3)];
    D3=inv(g*T3);
    H3=[VLdot*cos(kL)-VL*sin(kL)*kLdot;VLdot*sin(kL)+VL*cos(kL)*kLdot];
    
    X3dot=VL*cos(kL)-VW3*cos(kW3);
    Y3dot=VL*sin(kL)-VW3*sin(kW3);
    
    
    %%%%  PID控制 [VWc;kWc]  %%%%%%%%%%%%
     

%     kp3=0.015; kd3=0.45;
    kp3=0.02; kd3=1;
        u3=D3*(H3+kp3*[(X3-Xc3);(Y3-Yc3)]+kd3*[X3dot;Y3dot]);

    if u3(1)>3.5
        u3(1)=3.5;
    elseif u3(1)<-3.5
        u3(1)=-3.5;
    end

    if u3(2)>3.5
        u3(2)=3.5;
    elseif u3(2)<-3.5
        u3(2)=-3.5;
    end
    nxW3=u3(1);
    nyW3=u3(2);
    %%%%%%%%%%%%%%%%%%%%%
    nxW3_result(i)= nxW3;
    nyW3_result(i) = nyW3;
    %%%%%%%%%%%%%%%%%%%%%
    
      %%%%%%%%%%%%%%%%%   无人机运动模型（横向）%%%%%%%%%%%%%%%%%%%%%%%%
    
      %质点运动学模型
      
      VW3dot=g*nxW3;
      kW3dot=g*nyW3/VW3;
      XW3dot=VW3*cos(kW3);
      YW3dot=VW3*sin(kW3);
      %%%%%%%%%%%%%%%%%%   欧拉法积分 %%%%%%%%%%%
      
      VW3=VW3+VW3dot*h;
      kW3=kW3+kW3dot*h;
      XW3=XW3+XW3dot*h;
      YW3=YW3+YW3dot*h;
      
              %%%%%%%%%%%%%%%  长机   %%%%%%%%%%%%%%%%%%%%%%%%%%
    
      
t = t+h;
    i = i+1;
     h=hm(i);

          VL=VLm(i);
      kL=kLm(i);
    XL=XLm(i);
    YL=YLm(i);
 end
 
  i_1 = i - 1;

tm = t_result(1:i_1);
Hm = H0*ones(size(tm));

rcm = rc_result(1:i_1);
r1m = r1_result(1:i_1);
fc1m= fc1_result(1:i_1);
f11m= f11_result(1:i_1);

r2m = r2_result(1:i_1);
fc2m= fc2_result(1:i_1);
f22m= f22_result(1:i_1);

r3m = r3_result(1:i_1);
fc3m= fc3_result(1:i_1);
f33m= f33_result(1:i_1);

XLm= XLm(1:i_1);
YLm= YLm(1:i_1);
XW1m= XW1_result(1:i_1);
YW1m= YW1_result(1:i_1);
XW2m= XW2_result(1:i_1);
YW2m= YW2_result(1:i_1);
XW3m= XW3_result(1:i_1);
YW3m= YW3_result(1:i_1);
llamW1=xyz2lam(XW1m);
ffaiW1=xyz2lam(YW1m);
llamW2=xyz2lam(XW2m);
ffaiW2=xyz2lam(YW2m);
llamW3=xyz2lam(XW3m);
ffaiW3=xyz2lam(YW3m);

lamdafL=llamL(end);
faifL=ffaiL(end);
lamdafW1=llamW1(end);
faifW1=ffaiW1(end);
lamdafW2=llamW2(end);
faifW2=ffaiW2(end);
lamdafW3=llamW3(end);
faifW3=ffaiW3(end);

nxW1m=nxW1_result(1:i_1);
nyW1m=nyW1_result(1:i_1);
nxW2m=nxW2_result(1:i_1);
nyW2m=nyW2_result(1:i_1);
nxW3m=nxW3_result(1:i_1);
nyW3m=nyW3_result(1:i_1);

VLm= VLm(1:i_1);
kLm= kLm(1:i_1);
kLLm= kLL_result(1:i_1);
VW1m= VW1_result(1:i_1);
kW1m= kW1_result(1:i_1);
kWW1m= kWW1_result(1:i_1);
VW2m= VW2_result(1:i_1);
kW2m= kW2_result(1:i_1);
kWW2m= kWW2_result(1:i_1);
VW3m= VW3_result(1:i_1);
kW3m= kW3_result(1:i_1);
kWW3m= kWW3_result(1:i_1);

aa=664;
tn = t_result(1:aa:i_1);
Hn = H0*ones(size(tn));
XLn= XLm(1:aa:i_1);
YLn= YLm(1:aa:i_1);
XW1n= XW1_result(1:aa:i_1);
YW1n= YW1_result(1:aa:i_1);
XW2n= XW2_result(1:aa:i_1);
YW2n= YW2_result(1:aa:i_1);
XW3n= XW3_result(1:aa:i_1);
YW3n= YW3_result(1:aa:i_1);
lamLn= llamL(1:aa:i_1);
faiLn= ffaiL(1:aa:i_1);
lamW1n= llamW1(1:aa:i_1);
faiW1n= ffaiW1(1:aa:i_1);
lamW2n= llamW2(1:aa:i_1);
faiW2n= ffaiW2(1:aa:i_1);
lamW3n= llamW3(1:aa:i_1);
faiW3n= ffaiW3(1:aa:i_1);

X1m= X1_result(1:i_1);
Y1m= Y1_result(1:i_1);
X2m= X2_result(1:i_1);
Y2m= Y2_result(1:i_1);
X3m= X3_result(1:i_1);
Y3m= Y3_result(1:i_1);
Xc1m= Xc1_result(1:i_1);
Yc1m= Yc1_result(1:i_1);
Xc2m= Xc2_result(1:i_1);
Yc2m= Yc2_result(1:i_1);
Xc3m= Xc3_result(1:i_1);
Yc3m= Yc3_result(1:i_1);
theta1m=theta1_result(1:i_1);
theta2m=theta2_result(1:i_1);
theta3m=theta3_result(1:i_1);

SL1=s0530(llamL,ffaiL,lamc,faic);
SSSL1=SL1(end)
SW11=s0530(llamW1,ffaiW1,lamc,faic);
SSSW11=SW11(end)
SW21=s0530(llamW2,ffaiW2,lamc,faic);
SSSW21=SW21(end)
SW31=s0530(llamW3,ffaiW3,lamc,faic);
SSSW31=SW31(end)
t00=tm(end);
x0=[lamm01 Hm01 faim01 lamm02 Hm02 faim02 lamm03 Hm03 faim03 lamm04 Hm04 faim04];
save x0
save datad

% lamc201;

plot_formation;
