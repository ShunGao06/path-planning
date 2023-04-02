%  初始状态
% X-Z为水平面 Y为铅垂方向
% theta:速度与水平面夹角；pusai:速度在水平面投影与X轴夹角；
% q :弹目连线与水平面夹角（视线角）；p:弹目连线在水平面投影与X轴夹角；
% alpha:速度与弹目连线夹角；r:弹目直线距离

%% 考虑指令与实际之间存在时间延迟
%%  侧向通过偏置项控制攻击时间   纵向采用偏置项控制攻击角度；
%%  r>10时，按照指令控制az ay; 10>r>0.5,az ay保持不变； r<0.5 认为打中

clc;
clear;
% close all;

load Missle1.mat
lamm01=FlyData(end,8)/pi*180; Hm01=FlyData(end,2); faim01=FlyData(end,9)/pi*180;
v1=FlyData(end,3);
theta01=FlyData(end,15);
pusai01=-(FlyData(end,16)-pi/2);
load Missle2.mat
lamm02=FlyData(end,8)/pi*180; Hm02=FlyData(end,2); faim02=FlyData(end,9)/pi*180;
v2=FlyData(end,3);
theta02=FlyData(end,15);
pusai02=-(FlyData(end,16)-pi/2);
load Missle3.mat
lamm03=FlyData(end,8)/pi*180; Hm03=FlyData(end,2); faim03=FlyData(end,9)/pi*180;
v3=FlyData(end,3);
theta03=FlyData(end,15);
pusai03=-(FlyData(end,16)-pi/2);
load Missle4.mat
lamm04=FlyData(end,8)/pi*180; Hm04=FlyData(end,2); faim04=FlyData(end,9)/pi*180;
v4=FlyData(end,3);
theta04=FlyData(end,15);
pusai04=-(FlyData(end,16)-pi/2);


% N=3.15;N_z=3;t_delay=0.25;
% N_y=3;k=0.15;

N=3;N_z=3;t_delay=0.2;
N_y=3;k=0.25;
N_x=0.1;

%---------初值依赖系数k赋值-----------%
V_av=(v1+v2+v3+v4)/4;
k1=k*(1+1*(v1-V_av)/V_av);
k2=k*(1+1*(v2-V_av)/V_av);
k3=k*(1+1*(v3-V_av)/V_av);
k4=k*(1+1*(v4-V_av)/V_av);
%-------------------------------------%

lamt=145.4;     Ht=0;      fait=11.45;%最远
% lamt=145.35;     Ht=0;      fait=11.5;%中间
% lamt=145.3;     Ht=0;      fait=11.6;%最近

xt=lam2xyz(lamt);     yt=Ht;     zt=lam2xyz(fait); % (单位m)

xm01=lam2xyz(lamm01); ym01=Hm01; zm01=lam2xyz(faim01);
xm02=lam2xyz(lamm02); ym02=Hm02; zm02=lam2xyz(faim02);
xm03=lam2xyz(lamm03); ym03=Hm03; zm03=lam2xyz(faim03);
xm04=lam2xyz(lamm04); ym04=Hm04; zm04=lam2xyz(faim04);

thetad1=-70/180*pi;
thetad2=-70/180*pi;
thetad3=-70/180*pi;
thetad4=-70/180*pi; 

r01=sqrt((xt-xm01)^2+(yt-ym01)^2+(zt-zm01)^2);
r02=sqrt((xt-xm02)^2+(yt-ym02)^2+(zt-zm02)^2);
r03=sqrt((xt-xm03)^2+(yt-ym03)^2+(zt-zm03)^2);
r04=sqrt((xt-xm04)^2+(yt-ym04)^2+(zt-zm04)^2);
r0av=(r01+r02+r03+r04)/4;

s01=sqrt((xt-xm01)^2+(zt-zm01)^2);
s02=sqrt((xt-xm02)^2+(zt-zm02)^2);
s03=sqrt((xt-xm03)^2+(zt-zm03)^2);
s04=sqrt((xt-xm04)^2+(zt-zm04)^2);

q01=atan((yt-ym01)/s01);
q02=atan((yt-ym02)/s02);
q03=atan((yt-ym03)/s03);
q04=atan((yt-ym04)/s04);

p01=atan((zt-zm01)/(xt-xm01));
p02=atan((zt-zm02)/(xt-xm02));
p03=atan((zt-zm03)/(xt-xm03));
p04=atan((zt-zm04)/(xt-xm04));

%%%%%% 建立初始状态空间 %%%%%%
t_result = ones(50000,1);
t1_result = ones(50000,1);
t2_result = ones(50000,1);
t3_result = ones(50000,1);
t4_result = ones(50000,1);
xt_result = ones(50000,1);
yt_result = ones(50000,1);
zt_result = ones(50000,1);

i1_result = ones(50000,1);
i2_result = ones(50000,1);
i3_result = ones(50000,1);
i4_result = ones(50000,1);

xm1_result = ones(50000,1);
ym1_result = ones(50000,1);
zm1_result = ones(50000,1);

xm2_result = ones(50000,1);
ym2_result = ones(50000,1);
zm2_result = ones(50000,1);

xm3_result = ones(50000,1);
ym3_result = ones(50000,1);
zm3_result = ones(50000,1);

xm4_result = ones(50000,1);
ym4_result = ones(50000,1);
zm4_result = ones(50000,1);

r1_result = ones(50000,1);
r2_result = ones(50000,1);
r3_result = ones(50000,1);
r4_result = ones(50000,1);

s1_result = ones(50000,1);
s2_result = ones(50000,1);
s3_result = ones(50000,1);
s4_result = ones(50000,1);

theta1_result = ones(50000,1);
theta2_result = ones(50000,1);
theta3_result = ones(50000,1);
theta4_result = ones(50000,1);

pusai1_result = ones(50000,1);
pusai2_result = ones(50000,1);
pusai3_result = ones(50000,1);
pusai4_result = ones(50000,1);

q1_result = ones(50000,1);
q2_result = ones(50000,1);
q3_result = ones(50000,1);
q4_result = ones(50000,1);

p1_result = ones(50000,1);
p2_result = ones(50000,1);
p3_result = ones(50000,1);
p4_result = ones(50000,1);

etz1_result = ones(50000,1);
etz2_result = ones(50000,1);
etz3_result = ones(50000,1);
etz4_result = ones(50000,1);

ety1_result = ones(50000,1);
ety2_result = ones(50000,1);
ety3_result = ones(50000,1);
ety4_result = ones(50000,1);

alpha1_result = ones(50000,1);
alpha2_result = ones(50000,1);
alpha3_result = ones(50000,1);
alpha4_result = ones(50000,1);

tgo_1_result = ones(50000,1);
tgo_2_result = ones(50000,1);
tgo_3_result = ones(50000,1);
tgo_4_result = ones(50000,1);
tgo_av_result = ones(50000,1);
et1_result = ones(50000,1);
et2_result = ones(50000,1);
et3_result = ones(50000,1);
et4_result = ones(50000,1);

st_result = ones(50000,1);
% etgo_result = ones(100000,1);

at1_result = ones(50000,1);
at2_result = ones(50000,1);
at3_result = ones(50000,1);
at4_result = ones(50000,1);
ab1_result = ones(50000,1);
ab2_result = ones(50000,1);
ab3_result = ones(50000,1);
ab4_result = ones(50000,1);
az1_result = ones(50000,1);
az2_result = ones(50000,1);
az3_result = ones(50000,1);
az4_result = ones(50000,1);
az1_real_result = ones(50000,1);
az2_real_result = ones(50000,1);
az3_real_result = ones(50000,1);
az4_real_result = ones(50000,1);

att1_result = ones(50000,1);
att2_result = ones(50000,1);
att3_result = ones(50000,1);
att4_result = ones(50000,1);
abb1_result = ones(50000,1);
abb2_result = ones(50000,1);
abb3_result = ones(50000,1);
abb4_result = ones(50000,1);
ay1_result = ones(50000,1);
ay2_result = ones(50000,1);
ay3_result = ones(50000,1);
ay4_result = ones(50000,1);
ay1_real_result = ones(50000,1);
ay2_real_result = ones(50000,1);
ay3_real_result = ones(50000,1);
ay4_real_result = ones(50000,1);

% 初始状态赋值
xm1=xm01; ym1=ym01; zm1=zm01;
xm2=xm02; ym2=ym02;  zm2=zm02;
xm3=xm03; ym3=ym03;  zm3=zm03;
xm4=xm04; ym4=ym04;  zm4=zm04;
r1=r01; r2=r02; r3=r03;r4=r04;
s1=s01; s2=s02; s3=s03;s4=s04;

theta1=theta01; theta2=theta02; theta3=theta03;theta4=theta04;
pusai1=pusai01; pusai2=pusai02; pusai3=pusai03;pusai4=pusai04;

q1=q01; q2=q02; q3=q03;q4=q04;
p1=p01; p2=p02; p3=p03;p4=p04;

az1_real=0;
az2_real=0;
az3_real=0;
az4_real=0;
ay1_real=0;
ay2_real=0;
ay3_real=0;
ay4_real=0;
c1=1;c2=1;c3=1;c4=1;

i=1;t=0;h=0.001;  % 仿真步长0.1s

while (r1>1||r2>1||r3>1||r4>1)
    
    
    sinetz1=-cos(theta1)*sin(q1)*cos(pusai1-p1)+sin(theta1)*cos(q1);
    sinetz2=-cos(theta2)*sin(q2)*cos(pusai2-p2)+sin(theta2)*cos(q2);
    sinetz3=-cos(theta3)*sin(q3)*cos(pusai3-p3)+sin(theta3)*cos(q3);
    sinetz4=-cos(theta4)*sin(q4)*cos(pusai4-p4)+sin(theta4)*cos(q4);
    etz1=asin(sinetz1);
    etz2=asin(sinetz2);
    etz3=asin(sinetz3);
    etz4=asin(sinetz4);
    
    sinety1=-cos(theta1)*sin(p1-pusai1)/cos(etz1);
    sinety2=-cos(theta2)*sin(p2-pusai2)/cos(etz2);
    sinety3=-cos(theta3)*sin(p3-pusai3)/cos(etz3);
    sinety4=-cos(theta4)*sin(p4-pusai4)/cos(etz4);
    ety1=asin(sinety1);
    ety2=asin(sinety2);
    ety3=asin(sinety3);
    ety4=asin(sinety4);
    

    cosalpha1=cos(theta1)*cos(q1)*cos(pusai1-p1)+sin(theta1)*sin(q1);
    cosalpha2=cos(theta2)*cos(q2)*cos(pusai2-p2)+sin(theta2)*sin(q2);
    cosalpha3=cos(theta3)*cos(q3)*cos(pusai3-p3)+sin(theta3)*sin(q3);
    cosalpha4=cos(theta4)*cos(q4)*cos(pusai4-p4)+sin(theta4)*sin(q4);
    
    alpha1=acos(cosalpha1);
    alpha2=acos(cosalpha2);
    alpha3=acos(cosalpha3);
    alpha4=acos(cosalpha4);
    
    tgo_1=r1/v1*(1+((sin(alpha1))^2/2/(2*N_z-1)));
    tgo_2=r2/v2*(1+((sin(alpha2))^2/2/(2*N_z-1)));
    tgo_3=r3/v3*(1+((sin(alpha3))^2/2/(2*N_z-1)));
    tgo_4=r4/v4*(1+((sin(alpha4))^2/2/(2*N_z-1)));
    tgo_av=(tgo_1+tgo_2+tgo_3+tgo_4)/4;
    
    et1=tgo_1-tgo_av;
    et2=tgo_2-tgo_av;
    et3=tgo_3-tgo_av;
    et4=tgo_4-tgo_av;
    
    if ym1<0&&ym2<0&&ym3<0&&ym4<0
        break
    end
    
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
     
     xm4_result(i,1) = xm4;
     ym4_result(i,1) = ym4;
     zm4_result(i,1) = zm4;
     
     r1_result(i,1) = r1;
     r2_result(i,1) = r2;
     r3_result(i,1) = r3;
     r4_result(i,1) = r4;
     
     s1_result(i,1) = s1;
     s2_result(i,1) = s2;
     s3_result(i,1) = s3;
     s4_result(i,1) = s4;
     
     theta1_result(i,1) = theta1;
     theta2_result(i,1) = theta2;
     theta3_result(i,1) = theta3;
     theta4_result(i,1) = theta4;
     
     pusai1_result(i,1) = pusai1;
     pusai2_result(i,1) = pusai2;
     pusai3_result(i,1) = pusai3;
     pusai4_result(i,1) = pusai4;
     
     q1_result(i,1) = q1;
     q2_result(i,1) = q2;
     q3_result(i,1) = q3;
     q4_result(i,1) = q4;
     
     p1_result(i,1) = p1;
     p2_result(i,1) = p2;
     p3_result(i,1) = p3;
     p4_result(i,1) = p4;
     
     alpha1_result(i,1) = alpha1;
     alpha2_result(i,1) = alpha2;
     alpha3_result(i,1) = alpha3;
     alpha4_result(i,1) = alpha4;
     
     etz1_result(i,1) = etz1;
     etz2_result(i,1) = etz2;
     etz3_result(i,1) = etz3;
     etz4_result(i,1) = etz4;
     
     ety1_result(i,1) = ety1;
     ety2_result(i,1) = ety2;
     ety3_result(i,1) = ety3;
     ety4_result(i,1) = ety4;
     
     tgo_1_result(i,1) = tgo_1;
     tgo_2_result(i,1) = tgo_2;
     tgo_3_result(i,1) = tgo_3;
     tgo_4_result(i,1) = tgo_4;
     tgo_av_result(i,1) = tgo_av;
     et1_result(i,1) = et1;
     et2_result(i,1) = et2;
     et3_result(i,1) = et3;
     et4_result(i,1) = et4;
     
     v1_result(i,1)=v1;
     v2_result(i,1)=v2;
     v3_result(i,1)=v3;
     v4_result(i,1)=v4;
    
        
    %%  M1建模
    %%
    if r1>10
        
    q1dot=v1*(cos(theta1)*sin(q1)*cos(pusai1-p1)-sin(theta1)*cos(q1))/r1;
    p1dot=v1*cos(theta1)*sin(p1-pusai1)/s1;
    
    xm1dot=v1*cos(theta1)*cos(pusai1);
    ym1dot=v1*sin(theta1);
    zm1dot=v1*cos(theta1)*sin(pusai1);
    
    %     纵向     传统比例导引法+偏置项（修正攻击角度） 
    at1=N*v1*q1dot;  
    ab1=-v1*(theta1-N_z*q1+(N_z-1)*thetad1)/tgo_1; 
    az1=at1+ab1;
    
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
    
       %     侧向     传统比例导引法+偏置项（修正攻击时间）
    att1=N_y*v1*cos(theta1)*p1dot; 
    abb1=-k1*v1*sin(ety1)*cos(ety1)*et1;
    ay1=att1+abb1;
    
    ay1_realdot=(ay1-ay1_real)/t_delay;
    ay1_real=ay1_real+ay1_realdot*h;
    
    if ay1_real>=50
        ay1_real=50;
    elseif ay1_real<=-50
        ay1_real=-50;
    end
    
    att1_result(i,1) = att1;
    abb1_result(i,1) = abb1;
    ay1_result(i,1) = ay1;
    ay1_real_result(i,1) = ay1_real;
    pusai1dot=ay1_real/v1/cos(theta1);
    
    an1=sqrt(ay1_real^2+az1_real^2);
    ax1=N_x*an1;
    v1dot=-ax1-9.81*sin(theta1);
    v1=v1+v1dot*h;
    if v1<0
        break
    end
    
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
    
      %%
    elseif r1>=1&&r1<=10
%          q1dot=q1dot;
%          p1dot=p1dot;
%          xm1dot=xm1dot;
%          ym1dot=ym1dot;
%          zm1dot=zm1dot;
%          
%          %     纵向     传统比例导引法+偏置项（修正攻击角度） 
%     at1=N*v1*q1dot;  
%     ab1=-v1*(theta1-N*q1+(N-1)*thetad1)/tgo_1; 
%     az1=at1+ab1;
%     
%     az1_realdot=(az1-az1_real)/t_delay;   % 传递函数 G(s)=az_real（s)/az(s) = 1/(1+Ts) (T为t_delay) 
%     az1_real=az1_real+az1_realdot*h;
%    
%     if az1_real>=50
%         az1_real=50;
%     elseif az1_real<=-50
%         az1_real=-50;
%     end
    
    at1_result(i,1) = at1;
    ab1_result(i,1) = ab1;
    az1_result(i,1) = az1;
    az1_real_result(i,1) = az1_real;

    att1_result(i,1) = att1;
    abb1_result(i,1) = abb1;
    ay1_result(i,1) = ay1;
    ay1_real_result(i,1) = ay1_real;

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
      
    else
        
    i1_result(c1,1)=i;
        c1=c1+1;
       
    end
    
    %%  M2 建模
    if r2>10
        

    q2dot=v2*(cos(theta2)*sin(q2)*cos(pusai2-p2)-sin(theta2)*cos(q2))/r2;
    p2dot=v2*cos(theta2)*sin(p2-pusai2)/s2;
    
    xm2dot=v2*cos(theta2)*cos(pusai2);
    ym2dot=v2*sin(theta2);
    zm2dot=v2*cos(theta2)*sin(pusai2);
    
    %     纵向     传统比例导引法+偏置项（修正攻击角度） 
    at2=N*v2*q2dot;  
    ab2=-v2*(theta2-N_z*q2+(N_z-1)*thetad2)/tgo_2; 
    az2=at2+ab2;
    
    az2_realdot=(az2-az2_real)/t_delay;
    az2_real=az2_real+az2_realdot*h;
    
    if az2_real>=50
        az2_real=50;
    elseif az2_real<=-50
        az2_real=-50;
    end
    
    at2_result(i,1) = at2;
    ab2_result(i,1) = ab2;
    az2_result(i,1) = az2;
    az2_real_result(i,1) = az2_real;
    
    theta2dot=az2_real/v2;
    
       %     侧向     传统比例导引法+偏置项（修正攻击时间）
    att2=N_y*v2*cos(theta2)*p2dot; 
    abb2=-k2*v2*sin(ety2)*cos(ety2)*et2;
    ay2=att2+abb2;  
    
    ay2_realdot=(ay2-ay2_real)/t_delay;
    ay2_real=ay2_real+ay2_realdot*h;
    
    if ay2_real>=50
        ay2_real=50;
    elseif ay2_real<=-50
        ay2_real=-50;
    end
    
    att2_result(i,1) = att2;
    abb2_result(i,1) = abb2;
    ay2_result(i,1) = ay2;
    ay2_real_result(i,1) = ay2_real;
    
    pusai2dot=ay2_real/v2/cos(theta2);
    
    an2=sqrt(ay2_real^2+az2_real^2);
    ax2=N_x*an2;
    v2dot=-ax2-9.81*sin(theta2);
    v2=v2+v2dot*h;
    if v2<0
        break
    end
    
    %  M2欧拉法积分
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
      
%       cosalpha2=cos(theta2)*cos(q2)*cos(pusai2-p2)+sin(theta2)*sin(q2);
%       alpha2=acos(cosalpha2);

      %%    0.5=<r2<10
    elseif r2<=10&&r2>=1

    
    at2_result(i,1) = at2;
    ab2_result(i,1) = ab2;
    az2_result(i,1) = az2;
    az2_real_result(i,1) = az2_real;
    

    
    att2_result(i,1) = att2;
    abb2_result(i,1) = abb2;
    ay2_result(i,1) = ay2;
    ay2_real_result(i,1) = ay2_real;
    
%     pusai2dot=ay2_real/v2/cos(theta2);
    
    %  M1欧拉法积分
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
      
    else
        i2_result(c2,1)=i;
      c2=c2+1;
    end
    
    
        
    %%  M3建模
    %% r3>10
    if r3>10
        
%     r3dot=-v3*cos(q3-theta3);

    q3dot=v3*(cos(theta3)*sin(q3)*cos(pusai3-p3)-sin(theta3)*cos(q3))/r3;
    p3dot=v3*cos(theta3)*sin(p3-pusai3)/s3;
    
    xm3dot=v3*cos(theta3)*cos(pusai3);
    ym3dot=v3*sin(theta3);
    zm3dot=v3*cos(theta3)*sin(pusai3);
    
    %     纵向     传统比例导引法+偏置项（修正攻击角度） 
    at3=N*v3*q3dot;  
    ab3=-v3*(theta3-N_z*q3+(N_z-1)*thetad3)/tgo_3; 
    az3=at3+ab3;
    
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
    
       %     侧向     传统比例导引法+偏置项（修正攻击时间）
    att3=N_y*v3*cos(theta3)*p3dot; 
    abb3=-k3*v3*sin(ety3)*cos(ety3)*et3;
    ay3=att3+abb3;  
    
    ay3_realdot=(ay3-ay3_real)/t_delay;
    ay3_real=ay3_real+ay3_realdot*h;
    
    if ay3_real>=50
        ay3_real=50;
    elseif ay3_real<=-50
        ay3_real=-50;
    end
    
    att3_result(i,1) = att3;
    abb3_result(i,1) = abb3;
    ay3_result(i,1) = ay3;
    ay3_real_result(i,1) = ay3_real;
  
    pusai3dot=ay3_real/v3/cos(theta3);
    
    an3=sqrt(ay3_real^2+az3_real^2);
    ax3=N_x*an3;
    v3dot=-ax3-9.81*sin(theta3);
    v3=v3+v3dot*h;
    if v3<0
        break
    end    
    
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
      
%       cosalpha3=cos(theta3)*cos(q3)*cos(pusai3-p3)+sin(theta3)*sin(q3);
%       alpha3=acos(cosalpha3);
      
      %%  0.5=<r3<10
    elseif r3>=1&&r3<=10
        

    at3_result(i,1) = at3;
    ab3_result(i,1) = ab3;
    az3_result(i,1) = az3;
    az3_real_result(i,1) = az3_real;
    

    
    att3_result(i,1) = att3;
    abb3_result(i,1) = abb3;
    ay3_result(i,1) = ay3;
    ay3_real_result(i,1) = ay3_real;
  
%     pusai3dot=ay3_real/v3/cos(theta3);
    
    
    %  M3欧拉法积分
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
    
    r3=sqrt((xt-xm3)^2+(yt-ym3)^2+(zt-zm3)^2);
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
      
%       cosalpha3=cos(theta3)*cos(q3)*cos(pusai3-p3)+sin(theta3)*sin(q3);
%       alpha3=acos(cosalpha3);
      
    else
    i3_result(c3,1)=i;
      c3=c3+1;
    end
    
    
        %%  M4建模
    %% r4>10
    if r4>10


    q4dot=v4*(cos(theta4)*sin(q4)*cos(pusai4-p4)-sin(theta4)*cos(q4))/r4;
    p4dot=v4*cos(theta4)*sin(p4-pusai4)/s4;
    
    xm4dot=v4*cos(theta4)*cos(pusai4);
    ym4dot=v4*sin(theta4);
    zm4dot=v4*cos(theta4)*sin(pusai4);
    
    %     纵向     传统比例导引法+偏置项（修正攻击角度） 
    at4=N*v4*q4dot;  
    ab4=-v4*(theta4-N_z*q4+(N_z-1)*thetad4)/tgo_4; 
    az4=at4+ab4;
    
    az4_realdot=(az4-az4_real)/t_delay;
    az4_real=az4_real+az4_realdot*h;
    
    if az4_real>=50
        az4_real=50;
    elseif az4_real<=-50
        az4_real=-50;
    end
    at4_result(i,1) = at4;
    ab4_result(i,1) = ab4;
    az4_result(i,1) = az4;
    az4_real_result(i,1) = az4_real;
    
    theta4dot=az4_real/v4;
    
       %     侧向     传统比例导引法+偏置项（修正攻击时间）
    att4=N_y*v4*cos(theta4)*p4dot; 
    abb4=-k4*v4*sin(ety4)*cos(ety4)*et4;
    ay4=att4+abb4;  
    
    ay4_realdot=(ay4-ay4_real)/t_delay;
    ay4_real=ay4_real+ay4_realdot*h;
    
    if ay4_real>=50
        ay4_real=50;
    elseif ay4_real<=-50
        ay4_real=-50;
    end
    
    att4_result(i,1) = att4;
    abb4_result(i,1) = abb4;
    ay4_result(i,1) = ay4;
    ay4_real_result(i,1) = ay4_real;
  
    pusai4dot=ay4_real/v4/cos(theta4);
    
    an4=sqrt(ay4_real^2+az4_real^2);
    ax4=N_x*an4;
    v4dot=-ax4-9.81*sin(theta4);
    v4=v4+v4dot*h;
    if v4<0
        break
    end
    
    
    %%  M4欧拉法积分
    q4=q4+q4dot*h;
     %%%%%%%%%%%%%%%%%%
      if q4>=2*pi
          q4=q4-2*pi;
      elseif q4<=-2*pi
           q4=q4+2*pi ;

      end
      %%%%%%%%%%%%%%%%
      
      p4=p4+p4dot*h;
     %%%%%%%%%%%%%%%%%%
      if p4>=2*pi
          p4=p4-2*pi;
      elseif p4<=-2*pi
           p4=p4+2*pi ;
      end
      %%%%%%%%%%%%%%%%
    
      
    xm4=xm4+xm4dot*h;
    ym4=ym4+ym4dot*h;
    zm4=zm4+zm4dot*h;
    
    r4=sqrt((xt-xm4)^2+(yt-ym4)^2+(zt-zm4)^2)
    s4=sqrt((xt-xm4)^2+(zt-zm4)^2);
    
    theta4=theta4+theta4dot*h;
     %%%%%%%%%%%%%%%%%%
      if theta4>=2*pi
          theta4=theta4-2*pi;
      elseif theta4<=-2*pi
           theta4=theta4+2*pi ;

      end
      %%%%%%%%%%%%%%%%
 
       pusai4=pusai4+pusai4dot*h;
     %%%%%%%%%%%%%%%%%%
      if pusai4>=2*pi
          pusai4=pusai4-2*pi;
      elseif pusai4<=-2*pi
           pusai4=pusai4+2*pi ;
      end
      %%%%%%%%%%%%%%%%

      
      %%  0.5=<r4<10
    elseif r4>=1&&r4<=10
        

    at4_result(i,1) = at4;
    ab4_result(i,1) = ab4;
    az4_result(i,1) = az4;
    az4_real_result(i,1) = az4_real;
    


    
    att4_result(i,1) = att4;
    abb4_result(i,1) = abb4;
    ay4_result(i,1) = ay4;
    ay4_real_result(i,1) = ay4_real;
  
    
    %  M4欧拉法积分
    q4=q4+q4dot*h;
     %%%%%%%%%%%%%%%%%%
      if q4>=2*pi
          q4=q4-2*pi;
      elseif q4<=-2*pi
           q4=q4+2*pi ;

      end
      %%%%%%%%%%%%%%%%
      
      p4=p4+p4dot*h;
     %%%%%%%%%%%%%%%%%%
      if p4>=2*pi
          p4=p4-2*pi;
      elseif p4<=-2*pi
           p4=p4+2*pi ;
      end
      %%%%%%%%%%%%%%%%
    
      
    xm4=xm4+xm4dot*h;
    ym4=ym4+ym4dot*h;
    zm4=zm4+zm4dot*h;
    
    r4=sqrt((xt-xm4)^2+(yt-ym4)^2+(zt-zm4)^2);
    s4=sqrt((xt-xm4)^2+(zt-zm4)^2);
    
    theta4=theta4+theta4dot*h;
     %%%%%%%%%%%%%%%%%%
      if theta4>=2*pi
          theta4=theta4-2*pi;
      elseif theta4<=-2*pi
           theta4=theta4+2*pi ;

      end
      %%%%%%%%%%%%%%%%
 
       pusai4=pusai4+pusai4dot*h;
     %%%%%%%%%%%%%%%%%%
      if pusai4>=2*pi
          pusai4=pusai4-2*pi;
      elseif pusai4<=-2*pi
           pusai4=pusai4+2*pi ;
      end
      %%%%%%%%%%%%%%%%
      

      
    else
    i4_result(c4,1)=i;
      c4=c4+1;
    end
    
    t=t+h;
    i=i+1;
end
    
 
ii = i-1;

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
     eetz1=etz1_result(1:ii1);
     eety1=ety1_result(1:ii1);
     eet1=et1_result(1:ii1);
     vv1=v1_result(1:ii1);
     aaz1=az1_result(1:ii1);
     aat1= at1_result(1:ii1);
     aab1= ab1_result(1:ii1);
     aaz1_real=az1_real_result(1:ii1);
     aay1=ay1_result(1:ii1);
     aatt1= att1_result(1:ii1);
     aabb1= abb1_result(1:ii1);
     aay1_real=ay1_real_result(1:ii1);
     
     ii2=i2_result(1)-1;
     if ii2==0
         ii2=ii;
    end
     tt2 = t_result(1:ii2);
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
     vv2=v2_result(1:ii2);
     eetz2=etz2_result(1:ii2);
     eety2=ety2_result(1:ii2);
     eet2=et2_result(1:ii2);
     aaz2=az2_result(1:ii2);
     aat2= at2_result(1:ii2);
     aab2= ab2_result(1:ii2);
     aay2=ay2_result(1:ii2);
     aatt2= att2_result(1:ii2);
     aabb2= abb2_result(1:ii2);
     aaz2_real=az2_real_result(1:ii2);
     aay2_real=ay2_real_result(1:ii2);
     
     ii3=i3_result(1)-1;
     if ii3==0
         ii3=ii;
    end
     tt3 = t_result(1:ii3);
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
     vv3=v3_result(1:ii3);
     eetz3=etz3_result(1:ii3);
     eety3=ety3_result(1:ii3);
     eet3=et3_result(1:ii3); 
     aaz3=az3_result(1:ii3);
     aat3=at3_result(1:ii3);
     aab3=ab3_result(1:ii3);
     aay3=ay3_result(1:ii3);
     aatt3= att3_result(1:ii3);
     aabb3= abb3_result(1:ii3); 
     aaz3_real=az3_real_result(1:ii3);
     aay3_real=ay3_real_result(1:ii3);
     
     ii4=i4_result(1)-1;
     if ii4==0
         ii4=ii;
    end
     tt4 = t_result(1:ii4);
     xxm4=xm4_result(1:ii4);
     yym4=ym4_result(1:ii4);
     zzm4=zm4_result(1:ii4);
     llamm4=xyz2lam(xxm4);
     HHm4=yym4;
     ffaim4=xyz2lam(zzm4);
     rr4=r4_result(1:ii4);
     ss4=s4_result(1:ii4);
     ttheta4=theta4_result(1:ii4);
     ppusai4=pusai4_result(1:ii4);
     qq4=q4_result(1:ii4);  
     pp4=p4_result(1:ii4);
     ttgo_4=tgo_4_result(1:ii4);
     aalpha4=alpha4_result(1:ii4);
     vv4=v4_result(1:ii4);
     eetz4=etz4_result(1:ii4);
     eety4=ety4_result(1:ii4);
     eet4=et4_result(1:ii4); 
     aaz4=az4_result(1:ii4);
     aat4=at4_result(1:ii4);
     aab4=ab4_result(1:ii4);
     aay4=ay4_result(1:ii4);
     aatt4= att4_result(1:ii4);
     aabb4= abb4_result(1:ii4); 
     aaz4_real=az4_real_result(1:ii4);
     aay4_real=ay4_real_result(1:ii4);

     ttgo_av=tgo_av_result(1:ii);
%      sst=st_result(1:ii);
%      eetgo=etgo_result(1:ii);
     
Data_Resulta = [tt xxt yyt zzt llamt HHt ffait ttgo_av];
Data_Resultb=[tt1 xxm1 yym1 zzm1 llamm1 HHm1 ffaim1 rr1 ss1 ttheta1 ppusai1 qq1 pp1 ttgo_1 aalpha1 eetz1 eety1 eet1 aaz1 aay1 aaz1_real aay1_real];
Data_Resultc=[tt2 xxm2 yym2 zzm2 llamm2 HHm2 ffaim2 rr2 ss2 ttheta2 ppusai2 qq2 pp2 ttgo_2 aalpha2 eetz2 eety2 eet2 aaz2 aay2 aaz2_real aay2_real];
Data_Resultd=[tt3 xxm3 yym3 zzm3 llamm3 HHm3 ffaim3 rr3 ss3 ttheta3 ppusai3 qq3 pp3 ttgo_3 aalpha3 eetz3 eety3 eet3 aaz3 aay3 aaz3_real aay3_real ];
Data_Resulte=[tt4 xxm4 yym4 zzm4 llamm4 HHm4 ffaim4 rr4 ss4 ttheta4 ppusai4 qq4 pp4 ttgo_4 aalpha4 eetz4 eety4 eet4 aaz4 aay4 aaz4_real aay4_real ];
save Data_ResultPNGab

plot_figurePNGab;