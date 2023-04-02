%  初始状态%%               变比例系数
% X-Z为水平面 Y为铅垂方向
% theta:速度与水平面夹角；pusai:速度在水平面投影与X轴夹角；
% q :弹目连线与水平面夹角（视线角）；p:弹目连线在水平面投影与X轴夹角；
% alpha:速度与弹目连线夹角；r:弹目直线距离

%%   纵向采用偏置项控制攻击角度；  侧向通过变比例系数控制攻击时间  考虑指令与实际之间存在时间延迟
%%  r>10时，按照指令控制az ay; 10>r>0.5,az ay保持不变； r<0.5 认为打中
% clc;
% clear;
close all;

load Missle1.mat
lamm01=FlyData(end,8)/pi*180; Hm01=FlyData(end,2); faim01=FlyData(end,9)/pi*180;
v1=FlyData(end,3);
theta01=FlyData(end,15);
pusai01=-(FlyData(end,16)-pi/2);
t11=FlyData(end,end);
load Missle2.mat
lamm02=FlyData(end,8)/pi*180; Hm02=FlyData(end,2); faim02=FlyData(end,9)/pi*180;
v2=FlyData(end,3);
theta02=FlyData(end,15);
pusai02=-(FlyData(end,16)-pi/2);
t22=FlyData(end,end);
load Missle3.mat
lamm03=FlyData(end,8)/pi*180; Hm03=FlyData(end,2); faim03=FlyData(end,9)/pi*180;
v3=FlyData(end,3);
theta03=FlyData(end,15);
pusai03=-(FlyData(end,16)-pi/2);
t33=FlyData(end,end);

% lamt=144.72;     Ht=0;      fait=13.43;
lamt=handles.lamt;     Ht=0;      fait=handles.fait;  % 关岛位置
N=handles.N;
K=handles.K; t_delay=0.25;


xt=lam2xyz(lamt);     yt=Ht;     zt=lam2xyz(fait); % (单位m)
xm01=lam2xyz(lamm01); ym01=Hm01; zm01=lam2xyz(faim01);
xm02=lam2xyz(lamm02); ym02=Hm02; zm02=lam2xyz(faim02);
xm03=lam2xyz(lamm03); ym03=Hm03; zm03=lam2xyz(faim03);

% xt=50000;yt=0;zt=50000; % (单位m)
% 
% xm01=1000;ym01=7000;zm01=2000;
% xm02=2000;ym02=7000;zm02=1000;
% xm03=1500;ym03=7000;zm03=1500;

S1=s0411(lamt,fait,lamm01,faim01);
S2=s0411(lamt,fait,lamm02,faim02);
S3=s0411(lamt,fait,lamm03,faim03);

% theta01=-9.55/180*pi; thetad1=-60/180*pi; v1=798.8; % （单位m/s）
% theta02=-9.16/180*pi; thetad2=-60/180*pi; v2=801.8;
% theta03=-8.86/180*pi; thetad3=-60/180*pi; v3=799.92;

% theta01=-40/180*pi; 
% theta02=-40/180*pi; 
% theta03=-40/180*pi; 

% pusai01=-17.40/180*pi; 
% pusai02=-17.21/180*pi; 
% pusai03=-17.36/180*pi; 

thetad1=handles.thetad/180*pi;
thetad2=handles.thetad/180*pi;
thetad3=handles.thetad/180*pi;

r01=sqrt((xt-xm01)^2+(yt-ym01)^2+(zt-zm01)^2);
r02=sqrt((xt-xm02)^2+(yt-ym02)^2+(zt-zm02)^2);
r03=sqrt((xt-xm03)^2+(yt-ym03)^2+(zt-zm03)^2);
r0av=(r01+r02+r03)/3;

s01=sqrt((xt-xm01)^2+(zt-zm01)^2);
s02=sqrt((xt-xm02)^2+(zt-zm02)^2);
s03=sqrt((xt-xm03)^2+(zt-zm03)^2);

q01=atan((yt-ym01)/s01);
q02=atan((yt-ym02)/s02);
q03=atan((yt-ym03)/s03);

p01=atan((zt-zm01)/(xt-xm01));
p02=atan((zt-zm02)/(xt-xm02));
p03=atan((zt-zm03)/(xt-xm03));

% pusai01=p01; 
% pusai02=p02; 
% pusai03=p03; 

cosalpha01=cos(theta01)*cos(q01)*cos(pusai01-p01)+sin(theta01)*sin(q01);
cosalpha02=cos(theta02)*cos(q02)*cos(pusai02-p02)+sin(theta02)*sin(q02);
cosalpha03=cos(theta03)*cos(q03)*cos(pusai03-p03)+sin(theta03)*sin(q03);

alpha01=acos(cosalpha01);
alpha02=acos(cosalpha02);
alpha03=acos(cosalpha03);


tgo_01=r01/v1*(1+((sin(alpha01))^2/2/(2*N-1)));
tgo_02=r02/v2*(1+((sin(alpha02))^2/2/(2*N-1)));
tgo_03=r03/v3*(1+((sin(alpha03))^2/2/(2*N-1)));
tgo_0av=(tgo_01+tgo_02+tgo_03)/3;


%%%%%% 建立初始状态空间 %%%%%%

t_result = ones(50000,1);
t1_result = ones(50000,1);
t2_result = ones(50000,1);
t3_result = ones(50000,1);
xt_result = ones(50000,1);
yt_result = ones(50000,1);
zt_result = ones(50000,1);
llamt_result = ones(50000,1);
HHt_result = ones(50000,1);
ffait_result = ones(50000,1);

i1_result = ones(50000,1);
i2_result = ones(50000,1);
i3_result = ones(50000,1);

xm1_result = ones(50000,1);
ym1_result = ones(50000,1);
zm1_result = ones(50000,1);
llamm1_result = ones(50000,1);
HHm1_result = ones(50000,1);
ffaim1_result = ones(50000,1);

xm2_result = ones(50000,1);
ym2_result = ones(50000,1);
zm2_result = ones(50000,1);
llamm2_result = ones(50000,1);
HHm2_result = ones(50000,1);
ffaim2_result = ones(50000,1);

xm3_result = ones(50000,1);
ym3_result = ones(50000,1);
zm3_result = ones(50000,1);
llamm3_result = ones(50000,1);
HHm3_result = ones(50000,1);
ffaim3_result = ones(50000,1);

r1_result = ones(50000,1);
r2_result = ones(50000,1);
r3_result = ones(50000,1);

s1_result = ones(50000,1);
s2_result = ones(50000,1);
s3_result = ones(50000,1);

theta1_result = ones(50000,1);
theta2_result = ones(50000,1);
theta3_result = ones(50000,1);

pusai1_result = ones(50000,1);
pusai2_result = ones(50000,1);
pusai3_result = ones(50000,1);

q1_result = ones(50000,1);
q2_result = ones(50000,1);
q3_result = ones(50000,1);

p1_result = ones(50000,1);
p2_result = ones(50000,1);
p3_result = ones(50000,1);

alpha1_result = ones(50000,1);
alpha2_result = ones(50000,1);
alpha3_result = ones(50000,1);

tgo_1_result = ones(50000,1);
tgo_2_result = ones(50000,1);
tgo_3_result = ones(50000,1);
tgo_av_result = ones(50000,1);
st_result = ones(50000,1);
etgo_result = ones(50000,1);

N1_result = ones(50000,1);
N2_result = ones(50000,1);
N3_result = ones(50000,1);

at1_result = ones(50000,1);
at2_result = ones(50000,1);
at3_result = ones(50000,1);
ab1_result = ones(50000,1);
ab2_result = ones(50000,1);
ab3_result = ones(50000,1);
az1_result = ones(50000,1);
az2_result = ones(50000,1);
az3_result = ones(50000,1);
az1_real_result = ones(50000,1);
az2_real_result = ones(50000,1);
az3_real_result = ones(50000,1);

ay1_result = ones(50000,1);
ay2_result = ones(50000,1);
ay3_result = ones(50000,1);
ay1_real_result = ones(50000,1);
ay2_real_result = ones(50000,1);
ay3_real_result = ones(50000,1);

% 初始状态赋值
xm1=xm01; ym1=ym01; zm1=zm01;
xm2=xm02; ym2=ym02;  zm2=zm02;
xm3=xm03; ym3=ym03;  zm3=zm03;
r1=r01; r2=r02; r3=r03;
s1=s01; s2=s02; s3=s03;

theta1=theta01; theta2=theta02; theta3=theta03;
pusai1=pusai01; pusai2=pusai02; pusai3=pusai03;

q1=q01; q2=q02; q3=q03;
p1=p01; p2=p02; p3=p03;

alpha1=alpha01; alpha2=alpha02;alpha3=alpha03;

az1_real=0;
az2_real=0;
az3_real=0;
ay1_real=0;
ay2_real=0;
ay3_real=0;
c1=1;c2=1;c3=1;

i=1;t=0;h=0.001;  % 仿真步长0.001s

while (r1>2||r2>2||r3>2)
   
    tgo_1=r1/v1*(1+((sin(alpha1))^2/2/(2*N-1)));
    tgo_2=r2/v2*(1+((sin(alpha2))^2/2/(2*N-1)));
    tgo_3=r3/v3*(1+((sin(alpha3))^2/2/(2*N-1)));
    tgo_av=(tgo_1+tgo_2+tgo_3)/3;
    st=((tgo_1-tgo_av)^2+(tgo_2-tgo_av)^2+(tgo_3-tgo_av)^2)/3;
    etgo=max([tgo_1,tgo_2,tgo_3])-min([tgo_1,tgo_2,tgo_3]);
    
    ep1=tgo_av-tgo_1;
    ep2=tgo_av-tgo_2;
    ep3=tgo_av-tgo_3;
%     ep1=(tgo_2+tgo_3)/2-tgo_1;
%     ep2=(tgo_1+tgo_3)/2-tgo_2;
%     ep3=(tgo_1+tgo_2)/2-tgo_3;
    
    om1=K*r1*ep1/tgo_0av/r0av*((3*N-1)*(sin(alpha1))^2+(N-1)*sin(alpha1)*(thetad1-q1));
    om2=K*r2*ep2/tgo_0av/r0av*((3*N-1)*(sin(alpha2))^2+(N-1)*sin(alpha2)*(thetad2-q2));
    om3=K*r3*ep3/tgo_0av/r0av*((3*N-1)*(sin(alpha3))^2+(N-1)*sin(alpha3)*(thetad3-q3));
    N1=N*(1-om1);
    N2=N*(1-om2);
    N3=N*(1-om3);
    
     t_result(i,1) = t;
     xt_result(i,1) = xt;
     yt_result(i,1) = yt ;
     zt_result(i,1) = zt ;
     
     xm1_result(i,1) = xm1;
     ym1_result(i,1) = ym1;
     zm1_result(i,1) = zm1 ;
     
     xm2_result(i,1) = xm2;
     ym2_result(i,1) = ym2;
     zm2_result(i,1) = zm2;
     
     xm3_result(i,1) = xm3;
     ym3_result(i,1) = ym3;
     zm3_result(i,1) = zm3;
     
     r1_result(i,1) = r1;
     r2_result(i,1) = r2;
     r3_result(i,1) = r3;
     
     s1_result(i,1) = s1;
     s2_result(i,1) = s2;
     s3_result(i,1) = s3;
     
     theta1_result(i,1) = theta1;
     theta2_result(i,1) = theta2;
     theta3_result(i,1) = theta3;
     
     pusai1_result(i,1) = pusai1;
     pusai2_result(i,1) = pusai2;
     pusai3_result(i,1) = pusai3;
     
     q1_result(i,1) = q1;
     q2_result(i,1) = q2;
     q3_result(i,1) = q3;
     
     p1_result(i,1) = p1;
     p2_result(i,1) = p2;
     p3_result(i,1) = p3;
     
     alpha1_result(i,1) = alpha1;
     alpha2_result(i,1) = alpha2;
     alpha3_result(i,1) = alpha3;
     
     tgo_1_result(i,1) = tgo_1;
     tgo_2_result(i,1) = tgo_2;
     tgo_3_result(i,1) = tgo_3;
     tgo_av_result(i,1) = tgo_av;
     st_result(i,1) = st;
     etgo_result(i,1) = etgo;
     
     N1_result(i,1) = N1;
     N2_result(i,1) = N2;
     N3_result(i,1) = N3;
     
    
        
    %%  M1建模
    if r1>10
        
%     r1dot=-v1*(cos(theta1)*cos(q1)*cos(pusai1-p1)+sin(theta1)*sin(q1));
    q1dot=v1*(cos(theta1)*sin(q1)*cos(pusai1-p1)-sin(theta1)*cos(q1))/r1;
    p1dot=v1*cos(theta1)*sin(p1-pusai1)/s1;
    
    xm1dot=v1*cos(theta1)*cos(pusai1);
    ym1dot=v1*sin(theta1);
    zm1dot=v1*cos(theta1)*sin(pusai1);
    
    % 传统比例导引法+偏置项 控制加速度
    at1=N*v1*q1dot;  % 传统比例导引法
    ab1=-v1*(theta1-N*q1+(N-1)*thetad1)/tgo_1;  % 偏置项 修正攻击角度
    az1=(at1+ab1);  %  俯仰方向合加速度
    
    az1_realdot=(az1-az1_real)/t_delay;   % 传递函数 G(s)=az_real（s)/az(s) = 1/(1+Ts) (T为t_delay) 
    az1_real=az1_real+az1_realdot*h;
   
    if az1_real>=50
        az1_real=50;
    elseif az1_real<=-50
        az1_real=-50;
    end
    
    at1_result(i,1) = at1;
    ab1_result(i,1) = ab1;
    az1_result(i,1) = az1;
    az1_real_result(i,1) = az1_real;
    theta1dot=az1_real/v1;
    
       % 传统比例导引法+偏置项 控制加速度
    ay1=N1*v1*cos(theta1)*p1dot; 
    
    ay1_realdot=(ay1-ay1_real)/t_delay;
    ay1_real=ay1_real+ay1_realdot*h;
    
    if ay1_real>=50
        ay1_real=50;
    elseif ay1_real<=-50
        ay1_real=-50;
    end
%     abb1=-v1^2*(pusai1-N*p1+(N-1)*thetad1)/r1;  % 偏置项 修正攻击角度
%     ay1=att1+abb1;  %  俯仰方向合加速度

    ay1_result(i,1) = ay1;
    ay1_real_result(i,1) = ay1_real;
    pusai1dot=ay1_real/v1/cos(theta1);
    
    %%  M1欧拉法积分
  %  M1欧拉法积分
    q1=q1+q1dot*h;
     %%%%%%%%%%%%%%%%%%
      if q1>=2*pi
          q1=q1-2*pi;
      elseif q1<=-2*pi
           q1=q1+2*pi;
      end
      %%%%%%%%%%%%%%%%
      
      p1=p1+p1dot*h;
     %%%%%%%%%%%%%%%%%%
      if p1>=2*pi
          p1=p1-2*pi;
      elseif p1<=-2*pi
           p1=p1+2*pi ;
      end
      %%%%%%%%%%%%%%%%
      
    xm1=xm1+xm1dot*h;
    ym1=ym1+ym1dot*h;
    zm1=zm1+zm1dot*h;
    
    r1=sqrt((xt-xm1)^2+(yt-ym1)^2+(zt-zm1)^2);
    s1=sqrt((xt-xm1)^2+(zt-zm1)^2);
    
    theta1=theta1+theta1dot*h;
     %%%%%%%%%%%%%%%%%%
      if theta1>=2*pi
          theta1=theta1-2*pi;
      elseif theta1<=-2*pi
           theta1=theta1+2*pi;
      end
      %%%%%%%%%%%%%%%%
      
      pusai1=pusai1+pusai1dot*h;
     %%%%%%%%%%%%%%%%%%
      if pusai1>=2*pi
          pusai1=pusai1-2*pi;
      elseif pusai1<=-2*pi
           pusai1=pusai1+2*pi ;
      end
      %%%%%%%%%%%%%%%%
      
      cosalpha1=cos(theta1)*cos(q1)*cos(pusai1-p1)+sin(theta1)*sin(q1);
      alpha1=acos(cosalpha1);

    %%   r1>=2&&r1<=10
    elseif r1>=2&&r1<=10
            
    at1_result(i,1) = at1;
    ab1_result(i,1) = ab1;
    az1_result(i,1) = az1;
    az1_real_result(i,1) = az1_real;
    ay1_result(i,1) = ay1;
    ay1_real_result(i,1) = ay1_real;
        %  M1欧拉法积分
  %  M1欧拉法积分
    q1=q1+q1dot*h;
     %%%%%%%%%%%%%%%%%%
      if q1>=2*pi
          q1=q1-2*pi;
      elseif q1<=-2*pi
           q1=q1+2*pi;
      end
      %%%%%%%%%%%%%%%%
      
      p1=p1+p1dot*h;
     %%%%%%%%%%%%%%%%%%
      if p1>=2*pi
          p1=p1-2*pi;
      elseif p1<=-2*pi
           p1=p1+2*pi ;
      end
      %%%%%%%%%%%%%%%%
      
    xm1=xm1+xm1dot*h;
    ym1=ym1+ym1dot*h;
    zm1=zm1+zm1dot*h;
    
    r1=sqrt((xt-xm1)^2+(yt-ym1)^2+(zt-zm1)^2)
    s1=sqrt((xt-xm1)^2+(zt-zm1)^2);
    
    theta1=theta1+theta1dot*h;
     %%%%%%%%%%%%%%%%%%
      if theta1>=2*pi
          theta1=theta1-2*pi;
      elseif theta1<=-2*pi
           theta1=theta1+2*pi;
      end
      %%%%%%%%%%%%%%%%
      
      pusai1=pusai1+pusai1dot*h;
     %%%%%%%%%%%%%%%%%%
      if pusai1>=2*pi
          pusai1=pusai1-2*pi;
      elseif pusai1<=-2*pi
           pusai1=pusai1+2*pi ;
      end
      %%%%%%%%%%%%%%%%
      cosalpha1=cos(theta1)*cos(q1)*cos(pusai1-p1)+sin(theta1)*sin(q1);
      alpha1=acos(cosalpha1);

    else
        
    i1_result(c1,1)=i;
        c1=c1+1;
   
    end
    
    %%  M2 建模
    if r2>10
        
    %     r2dot=-v2*(cos(theta2)*cos(q2)*cos(pusai2-p2)+sin(theta2)*sin(q2));
    q2dot=v2*(cos(theta2)*sin(q2)*cos(pusai2-p2)-sin(theta2)*cos(q2))/r2;
    p2dot=v2*cos(theta2)*sin(p2-pusai2)/s2;
    
    xm2dot=v2*cos(theta2)*cos(pusai2);
    ym2dot=v2*sin(theta2);
    zm2dot=v2*cos(theta2)*sin(pusai2);
    
    % 传统比例导引法+偏置项 控制加速度
    at2=N*v2*q2dot;  % 传统比例导引法
    ab2=-v2*(theta2-N*q2+(N-1)*thetad2)/tgo_2;  % 偏置项 修正攻击角度
    az2=(at2+ab2);  % 合加速度
    
    az2_realdot=(az2-az2_real)/t_delay;
    az2_real=az2_real+az2_realdot*h;
    
    if az2_real>=50
        az2_real=50;
    elseif az2_real<=-50
        az2_real=-50;
    end
%     
    at2_result(i,1) = at2;
    ab2_result(i,1) = ab2;
    az2_result(i,1) = az2;
    az2_real_result(i,1) = az2_real;
    
    theta2dot=az2_real/v2;
    
     % 传统比例导引法+偏置项 控制加速度
    ay2=N2*v2*cos(theta2)*p2dot;  % 传统比例导引法
    
    ay2_realdot=(ay2-ay2_real)/t_delay;
    ay2_real=ay2_real+ay2_realdot*h;
%     
    if ay2_real>=50
        ay2_real=50;
    elseif ay2_real<=-50
        ay2_real=-50;
    end
%     abb1=-v1^2*(pusai1-N*p1+(N-1)*thetad1)/r1;  % 偏置项 修正攻击角度
%     ay1=att1+abb1;  %  偏航方向合加速度

    ay2_result(i,1) = ay2;
    ay2_real_result(i,1) = ay2_real;
    
    pusai2dot=ay2_real/v2/cos(theta2);
    
    %%  M2欧拉法积分
 q2=q2+q2dot*h;
     %%%%%%%%%%%%%%%%%%
      if q2>=2*pi
          q2=q2-2*pi;
      elseif q2<=-2*pi
           q2=q2+2*pi ;
      end
      %%%%%%%%%%%%%%%%
      
      p2=p2+p2dot*h;
     %%%%%%%%%%%%%%%%%%
      if p2>=2*pi
          p2=p2-2*pi;
      elseif p2<=-2*pi
           p2=p2+2*pi ;
      end
      %%%%%%%%%%%%%%%%
      
      
    xm2=xm2+xm2dot*h;
    ym2=ym2+ym2dot*h;
    zm2=zm2+zm2dot*h;
    
    r2=sqrt((xt-xm2)^2+(yt-ym2)^2+(zt-zm2)^2)
    s2=sqrt((xt-xm2)^2+(zt-zm2)^2);
    
    theta2=theta2+theta2dot*h;
     %%%%%%%%%%%%%%%%%%
      if theta2>=2*pi
          theta2=theta2-2*pi;
      elseif theta2<=-2*pi
           theta2=theta2+2*pi ;
      end
      %%%%%%%%%%%%%%%%
      
      pusai2=pusai2+pusai2dot*h;
     %%%%%%%%%%%%%%%%%%
      if pusai2>=2*pi
          pusai2=pusai2-2*pi;
      elseif pusai2<=-2*pi
           pusai2=pusai2+2*pi ;
      end
      %%%%%%%%%%%%%%%%
      
      cosalpha2=cos(theta2)*cos(q2)*cos(pusai2-p2)+sin(theta2)*sin(q2);
      alpha2=acos(cosalpha2);
      
    elseif r2>=2&&r2<=10

    at2_result(i,1) = at2;
    ab2_result(i,1) = ab2;
    az2_result(i,1) = az2;
    az2_real_result(i,1) = az2_real;
    ay2_result(i,1) = ay2;
    ay2_real_result(i,1) = ay2_real;
    
    % 欧拉法积分
     q2=q2+q2dot*h;
     %%%%%%%%%%%%%%%%%%
      if q2>=2*pi
          q2=q2-2*pi;
      elseif q2<=-2*pi
           q2=q2+2*pi ;
      end
      %%%%%%%%%%%%%%%%
      
      p2=p2+p2dot*h;
     %%%%%%%%%%%%%%%%%%
      if p2>=2*pi
          p2=p2-2*pi;
      elseif p2<=-2*pi
           p2=p2+2*pi ;
      end
      %%%%%%%%%%%%%%%%
      
      
    xm2=xm2+xm2dot*h;
    ym2=ym2+ym2dot*h;
    zm2=zm2+zm2dot*h;
    
    r2=sqrt((xt-xm2)^2+(yt-ym2)^2+(zt-zm2)^2);
    s2=sqrt((xt-xm2)^2+(zt-zm2)^2);
    
    theta2=theta2+theta2dot*h;
     %%%%%%%%%%%%%%%%%%
      if theta2>=2*pi
          theta2=theta2-2*pi;
      elseif theta2<=-2*pi
           theta2=theta2+2*pi ;
      end
      %%%%%%%%%%%%%%%%
      
      pusai2=pusai2+pusai2dot*h;
     %%%%%%%%%%%%%%%%%%
      if pusai2>=2*pi
          pusai2=pusai2-2*pi;
      elseif pusai2<=-2*pi
           pusai2=pusai2+2*pi ;
      end
      %%%%%%%%%%%%%%%%
      
      cosalpha2=cos(theta2)*cos(q2)*cos(pusai2-p2)+sin(theta2)*sin(q2);
      alpha2=acos(cosalpha2);
    
    else 
    i2_result(c2,1)=i;
      c2=c2+1;
    
    end
    
    
        
    %%  M3建模
    
    if r3>10
        
%     r3dot=-v3*cos(q3-theta3);

    q3dot=v3*(cos(theta3)*sin(q3)*cos(pusai3-p3)-sin(theta3)*cos(q3))/r3;
    p3dot=v3*cos(theta3)*sin(p3-pusai3)/s3;
    
    xm3dot=v3*cos(theta3)*cos(pusai3);
    ym3dot=v3*sin(theta3);
    zm3dot=v3*cos(theta3)*sin(pusai3);
    
    % 传统比例导引法+偏置项 控制加速度
    at3=N*v3*q3dot;  % 传统比例导引法
    ab3=-v3*(theta3-N*q3+(N-1)*thetad3)/tgo_3;  % 偏置项 修正攻击角度
    az3=(at3+ab3);  % 合加速度
    
    az3_realdot=(az3-az3_real)/t_delay;
    az3_real=az3_real+az3_realdot*h;
    
    if az3_real>=50
        az3_real=50;
    elseif az3_real<=-50
        az3_real=-50;
    end
    at3_result(i,1) = at3;
    ab3_result(i,1) = ab3;
    az3_result(i,1) = az3;
    az3_real_result(i,1) = az3_real;
    
    theta3dot=az3_real/v3;
    
    % 变比例系数 控制加速度
    ay3=N3*v3*cos(theta3)*p3dot; 
    
    ay3_realdot=(ay3-ay3_real)/t_delay;
    ay3_real=ay3_real+ay3_realdot*h;
    
    if ay3_real>=50
        ay3_real=50;
    elseif ay3_real<=-50
        ay3_real=-50;
    end

    ay3_result(i,1) = ay3;
    ay3_real_result(i,1) = ay3_real;
  
    pusai3dot=ay3_real/v3/cos(theta3);
    
    
    %%  M3欧拉法积分
q3=q3+q3dot*h;
     %%%%%%%%%%%%%%%%%%
      if q3>=2*pi
          q3=q3-2*pi;
      elseif q3<=-2*pi
           q3=q3+2*pi ;

      end
      %%%%%%%%%%%%%%%%
      
      p3=p3+p3dot*h;
     %%%%%%%%%%%%%%%%%%
      if p3>=2*pi
          p3=p3-2*pi;
      elseif p3<=-2*pi
           p3=p3+2*pi ;
      end
      %%%%%%%%%%%%%%%%
    
      
    xm3=xm3+xm3dot*h;
    ym3=ym3+ym3dot*h;
    zm3=zm3+zm3dot*h;
    
    r3=sqrt((xt-xm3)^2+(yt-ym3)^2+(zt-zm3)^2)
    s3=sqrt((xt-xm3)^2+(zt-zm3)^2);
    
    theta3=theta3+theta3dot*h;
     %%%%%%%%%%%%%%%%%%
      if theta3>=2*pi
          theta3=theta3-2*pi;
      elseif theta3<=-2*pi
           theta3=theta3+2*pi ;

      end
      %%%%%%%%%%%%%%%%
 
       pusai3=pusai3+pusai3dot*h;
     %%%%%%%%%%%%%%%%%%
      if pusai3>=2*pi
          pusai3=pusai3-2*pi;
      elseif pusai3<=-2*pi
           pusai3=pusai3+2*pi ;
      end
      %%%%%%%%%%%%%%%%
      
      cosalpha3=cos(theta3)*cos(q3)*cos(pusai3-p3)+sin(theta3)*sin(q3);
      alpha3=acos(cosalpha3);
      
    elseif r3>=2&&r3<=10
        
    at3_result(i,1) = at3;
    ab3_result(i,1) = ab3;
    az3_result(i,1) = az3;
    az3_real_result(i,1)= az3_real;
    ay3_result(i,1) = ay3;
    ay3_real_result(i,1) = ay3_real;
    
       %%  M3欧拉法积分
        q3=q3+q3dot*h;
     %%%%%%%%%%%%%%%%%%
      if q3>=2*pi
          q3=q3-2*pi;
      elseif q3<=-2*pi
           q3=q3+2*pi ;

      end
      %%%%%%%%%%%%%%%%
      
      p3=p3+p3dot*h;
     %%%%%%%%%%%%%%%%%%
      if p3>=2*pi
          p3=p3-2*pi;
      elseif p3<=-2*pi
           p3=p3+2*pi ;
      end
      %%%%%%%%%%%%%%%%
    
      
    xm3=xm3+xm3dot*h;
    ym3=ym3+ym3dot*h;
    zm3=zm3+zm3dot*h;
    
    r3=sqrt((xt-xm3)^2+(yt-ym3)^2+(zt-zm3)^2)
    s3=sqrt((xt-xm3)^2+(zt-zm3)^2);
    
    theta3=theta3+theta3dot*h;
     %%%%%%%%%%%%%%%%%%
      if theta3>=2*pi
          theta3=theta3-2*pi;
      elseif theta3<=-2*pi
           theta3=theta3+2*pi ;

      end
      %%%%%%%%%%%%%%%%
 
       pusai3=pusai3+pusai3dot*h;
     %%%%%%%%%%%%%%%%%%
      if pusai3>=2*pi
          pusai3=pusai3-2*pi;
      elseif pusai3<=-2*pi
           pusai3=pusai3+2*pi ;
      end
      %%%%%%%%%%%%%%%%
      
      cosalpha3=cos(theta3)*cos(q3)*cos(pusai3-p3)+sin(theta3)*sin(q3);
      alpha3=acos(cosalpha3);

    
    else
    i3_result(c3,1)=i;
    c3=c3+1;    
    end
    
    t=t+h;
    i=i+1;
end
    
 
ii = i - 1;

tt = t_result(1:ii);
xxt=xt_result(1:ii);
yyt=yt_result(1:ii);
zzt=zt_result(1:ii);
llamt=xyz2lam(xxt);
HHt=yyt;
ffait=xyz2lam(zzt);

ii1=i1_result(1)-1;
if ii1==0
    ii1=ii;
end
     tt1 = t_result(1:ii1);
     tt1_real =tt1+t11;
     xxm1=xm1_result(1:ii1);
     yym1=ym1_result(1:ii1);
     zzm1=zm1_result(1:ii1);
     llamm1=xyz2lam(xxm1);
     HHm1=yym1;
     ffaim1=xyz2lam(zzm1);
     rr1=r1_result(1:ii1);
     ss1=s1_result(1:ii1);
     ttheta1=theta1_result(1:ii1);
     ppusai1=pusai1_result(1:ii1);
     qq1=q1_result(1:ii1);
     pp1=p1_result(1:ii1);
     ttgo_1=tgo_1_result(1:ii1);
     aalpha1=alpha1_result(1:ii1);
     NN1=N1_result(1:ii1);
     aat1=at1_result(1:ii1);
     aab1=ab1_result(1:ii1);
     aaz1=az1_result(1:ii1);
     aay1=ay1_result(1:ii1);
     aaz1_real=az1_real_result(1:ii1);
     aay1_real=ay1_real_result(1:ii1);
     
     
     ii2=i2_result(1)-1;
     if ii2==0
         ii2=ii;
    end
     tt2 = t_result(1:ii2);
     tt2_real =tt2+t22;
     xxm2=xm2_result(1:ii2);
     yym2=ym2_result(1:ii2);
     zzm2=zm2_result(1:ii2);
     llamm2=xyz2lam(xxm2);
     HHm2=yym2;
     ffaim2=xyz2lam(zzm2);
     rr2=r2_result(1:ii2);
     ss2=s2_result(1:ii2);
     ttheta2=theta2_result(1:ii2);
     ppusai2=pusai2_result(1:ii2);
     qq2=q2_result(1:ii2);
     pp2=p2_result(1:ii2);
     ttgo_2=tgo_2_result(1:ii2);
     aalpha2=alpha2_result(1:ii2);
     NN2=N2_result(1:ii2);
     aat2=at2_result(1:ii2);
     aab2=ab2_result(1:ii2);
     aaz2=az2_result(1:ii2);
     aay2=ay2_result(1:ii2);
     aaz2_real=az2_real_result(1:ii2);
     aay2_real=ay2_real_result(1:ii2);
     
ii3=i3_result(1)-1;
     if ii3==0
         ii3=ii;
    end
     tt3 = t_result(1:ii3);
     tt3_real =tt3+t33;
     xxm3=xm3_result(1:ii3);
     yym3=ym3_result(1:ii3);
     zzm3=zm3_result(1:ii3);
     llamm3=xyz2lam(xxm3);
     HHm3=yym3;
     ffaim3=xyz2lam(zzm3);
     rr3=r3_result(1:ii3);
     ss3=s3_result(1:ii3);
     ttheta3=theta3_result(1:ii3);
     ppusai3=pusai3_result(1:ii3);
     qq3=q3_result(1:ii3);  
     pp3=p3_result(1:ii3);
     ttgo_3=tgo_3_result(1:ii3);
     aalpha3=alpha3_result(1:ii3);
     NN3=N3_result(1:ii3); 
     aat3=at3_result(1:ii3);
     aab3=ab3_result(1:ii3);
     aaz3=az3_result(1:ii3); 
     aay3=ay3_result(1:ii3); 
     aaz3_real=az3_real_result(1:ii3);
     aay3_real=ay3_real_result(1:ii3);
     
     lamc=121.57;Hc=0;faic=38.93;     
     SL3 =s0530(llamm3,ffaim3,lamc,faic);
     SW23=s0530(llamm2,ffaim2,lamc,faic);
     SW13=s0530(llamm1,ffaim1,lamc,faic);

     ttgo_av=tgo_av_result(1:ii);
     sst=st_result(1:ii);
     eetgo=etgo_result(1:ii);
     
Data_Resulta = [tt xxt yyt zzt llamt HHt ffait ttgo_av sst eetgo];
Data_Resultb = [tt1 tt1_real xxm1 yym1 zzm1 llamm1 HHm1 ffaim1 rr1 ss1 ttheta1 ppusai1 qq1 pp1 aalpha1 ttgo_1 NN1 aat1 aab1 aaz1 aay1 aaz1_real aay1_real];
Data_Resultc = [tt2 tt2_real xxm2 yym2 zzm2 llamm2 HHm2 ffaim2 rr2 ss2 ttheta2 ppusai2 qq2 pp2 aalpha2 ttgo_2 NN2 aat2 aab2 aaz2 aay2 aaz2_real aay2_real];
Data_Resultd = [tt3 tt3_real xxm3 yym3 zzm3 llamm3 HHm3 ffaim3 rr3 ss3 ttheta3 ppusai3 qq3 pp3 aalpha3 ttgo_3 NN3 aat3 aab3 aaz3 aay3 aaz3_real aay3_real];
save Data_ResultPNGn

plot_figurePNGn;
% plotall;