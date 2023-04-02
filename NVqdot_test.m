clc;
clear;
close all;

load Missle1.mat
lamm01=FlyData(end,8)/pi*180; Hm01=FlyData(end,2); faim01=FlyData(end,9)/pi*180;%%出发点
v01=FlyData(end,3);
theta01=FlyData(end,15);
pusai01=-(FlyData(end,16)-pi/2);
lamt=144.72;     Ht=0;      fait=13.43;%%目标坐标
xt=lam2xyz(lamt);     yt=Ht;     zt=lam2xyz(fait); % (单位m)

xm01=lam2xyz(lamm01); ym01=Hm01; zm01=lam2xyz(faim01);

thetad1=-70/180*pi;

r01=sqrt((xt-xm01)^2+(yt-ym01)^2+(zt-zm01)^2);
s01=sqrt((xt-xm01)^2+(zt-zm01)^2);

q01=-asin(Hm01./r01);
p01=atan((zt-zm01)/(xt-xm01));

x1=xm01;
y1=ym01;
z1=zm01;

v1=v01;
theta1=theta01;
pusai1=pusai01;
q1=q01;
p1=p01;

r1=r01;
s1=s01;

N=5;
h=6949;

delta_t=0.001;
i=1;
t=0;
mass=907;
while y1>0  
    
    
    q1dot=v1*(cos(theta1)*sin(q1)*cos(pusai1-p1)-sin(theta1)*cos(q1))/r1;
    p1dot=v1*cos(theta1)*sin(p1-pusai1)/s1;
    
    az1=N*v1*q1dot;
    ay1=N*v1*cos(theta1)*p1dot;
    if az1>=4
        az1=4;
    elseif az1<=-4
        az1=-4;
    end
    
    if ay1>=4
        ay1=4;
    elseif ay1<=-4
        ay1=-4;
    end
    
    an1=sqrt(ay1^2+az1^2);
    ax1=0.1*an1;
    
    x1dot=-v1*cos(theta1)*cos(pusai1);
    y1dot=v1*sin(theta1);
    z1dot=-v1*cos(theta1)*sin(pusai1);
    
    
    v1dot=-ax1-9.81*sin(q1);
    
    
    theta1dot=az1/v1;
    pusai1dot=ay1/v1/cos(theta1);
%     r1dot=-v1*(cos(theta1)*cos(q1)*cos(pusai1-p1)-sin(theta1)*cos(q1));
    
    x1=x1+x1dot*delta_t;
    y1=y1+y1dot*delta_t;
    z1=z1+z1dot*delta_t;
    
    v1=v1+v1dot*delta_t
    
    r1=sqrt((xt-x1)^2+(yt-y1)^2+(zt-z1)^2);
%     r1=r1+r1dot*delta_t
    s1=sqrt((xt-x1)^2+(zt-z1)^2);
    
    q1=q1+q1dot*delta_t;
      if q1>=2*pi
          q1=q1-2*pi;
      elseif q1<=-2*pi
           q1=q1+2*pi;
      end
     p1=p1+p1dot*delta_t;
      if p1>=2*pi
          p1=p1-2*pi;
      elseif p1<=-2*pi
           p1=p1+2*pi;
      end
      
    theta1=theta1+theta1dot*delta_t;
      if theta1>=2*pi
          theta1=theta1-2*pi;
      elseif theta1<=-2*pi
           theta1=theta1+2*pi;
      end
    pusai1=pusai1+pusai1dot*delta_t;
      if pusai1>=2*pi
          pusai1=pusai1-2*pi;
      elseif pusai1<=-2*pi
           pusai1=pusai1+2*pi ;
      end
      
      
    az1_result(i)=az1;
    ay1_result(i)=ay1;
    x1_result(i)=x1;
    y1_result(i)=y1;
    z1_result(i)=z1;
    V1r(i)=v1;
    Tr(i)=t;
    
    i=i+1;
    t=t+0.001;
end
figure(1)
plot3(x1_result,z1_result,y1_result,'b','LineWidth',2)
hold on
plot3(xt,zt,yt,'o','LineWidth',2)
xlabel('x');
zlabel('y');
ylabel('z');
grid on

figure(2)
plot(Tr,V1r)