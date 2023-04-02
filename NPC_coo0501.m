function FlyData=NPC_coo0501(alpha1,sigma,M)

sigma=sigma*pi/180;


Monte_Carlo=cell(20,1);
% delta_phi_width=17;
% M=1;    
    %%%%-- 2020.10 for CAV-H 公开气动数据--%%%%
    
     if M==1
        load dataNPC_48 %读取输入初值
        load dataEND_48
    elseif M==2
        load dataNPC_49 %读取输入初值
        load dataEND_49
    elseif M==3
        load dataNPC_50 %读取输入初值
        load dataEND_50
    elseif M==4
        load dataNPC_47 %读取输入初值
        load dataEND_47
    end
    
Re = 6378145;
g0 = 9.80665;
S=0.48387;
delta_phi_width=3;

t0=0;
load t00
V=dataNPC(1);%+20*unifrnd(-1,1,1,1);%速度拉20
r0=dataNPC(2);%+3000*unifrnd(-1,1,1,1);%高度拉3km
lamda_o=dataNPC(3)+0*pi/180;%+0.2*normrnd(0,0.03)*pi/180; %经度
fai_o=dataNPC(4)+0*pi/180;%+0.2*normrnd(0,0.03)*pi/180;   %纬度
%gamma=-0.1303*pi/180;
gamma=dataNPC(5);
% phi=dataNPC(6);
mass=907;

%      H_all=22e3;
V_all=dataEND(1);
%      V_all=800;
H_all=dataEND(2)-Re;
e_all=1/2;
%      lamda_final=150*pi/180;
lamda_final=dataEND(3)+0*pi/180;
%      fai_final=40*pi/180;
fai_final=dataEND(4)+0*pi/180;
delta_t=1;

S_togo_Z=acos(sin(fai_final)*sin(fai_o)+cos(fai_final)*cos(fai_o)*cos(lamda_final-lamda_o));
S_aim=S_togo_Z*Re;
PHI_o=pi-asin(sin(lamda_final-lamda_o)*cos(fai_o)/sin(S_togo_Z));
phi=PHI_o;

H=r0-Re;
Mach=V/AirSpeedCal(H);
Q=0.5*AirRhoCal(H)*V*V;
g=g0*((Re/(Re+H))^2);
% Thrust=0;
% Isp=100;

%%%%%% 状态赋初值 %%%%%%
%发射点位置
%目标点总航程
C=sin(pi/2-fai_final)*sin(pi/2-fai_o)*cos(lamda_final-lamda_o)+cos(pi/2-fai_final)*cos(pi/2-fai_o);
S_all=0.9*Re*acos(C);
S_togo=0.99*S_all;
t=t0;

Af=40*pi/180;
sgn=1;
Re = 6378145;
mu=5.965*10^24*6.67*10^(-11);%引力系数


%积分变量初值
r=r0;
lamda=lamda_o;
fai=fai_o;
rangeS=0;
e=1/(r/(Re+H_all))-V/V_all*V/V_all/2;
%%%%%% 建立初始状态空间 %%%%%%
t_result = ones(100000,1);
H_result = ones(100000,1);
V_result = ones(100000,1);
theta_result = ones(100000,1);
mass_result = ones(100000,1);
alpha_result = ones(100000,1);
L_result = ones(100000,1);
D_result= ones(100000,1);
x_result= ones(100000,1);
y_result= ones(100000,1);
z_result= ones(100000,1);
xe_result= ones(100000,1);
ye_result= ones(100000,1);
ze_result= ones(100000,1);
fai_result= ones(100000,1);
lamda_result= ones(100000,1);
range_result= ones(100000,1);
sigma_result= ones(100000,1);
rangeS_result= ones(100000,1);
ZZ_result= ones(100000,1);
ZZ_up_result= ones(100000,1);
ZZ_down_result= ones(100000,1);

i=1;ii=1;iii=1;ei=1;
mark=1;mark1=1;
error_final=1;
%真实状态循环
while H>H_all 

    alpha2=13;

    V2=1000;
    V1=900;
    
    if V>V2
        alpha=alpha2;
        alpha=alpha*pi/180;
    elseif V<V1
        alpha=alpha1*pi/180;
    else
        alpha=((alpha1-alpha2)/(V1-V2)*(V-V2)+alpha2)*pi/180;
    end
%     alpha=15*pi/180;
   
    
    %%%%%%%%%%%%%%%%%预测状态循环%%%%%%%%%%%%%%%%%%%%
    f=10e6;f1=10e6;
    S_togo_Z=acos(sin(fai_final)*sin(fai)+cos(fai_final)*cos(fai)*cos(lamda_final-lamda));
    S_togo_Z_result(i,1)=S_togo_Z;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%标记：根据预测环节数据结果，发现V<1000后幅值影响不显著%%%
    
    
    if S_togo_Z<0.05
        delta_t=0.5;
    end
    PHI=pi-asin(sin(lamda_final-lamda)*cos(fai)/sin(S_togo_Z));
%     if lamda>lamda_final
%         PHI=pi-PHI;
%     end
    delta_phi=phi-PHI;
    ZZ=delta_phi;
%     if V>1500
        ZZ_down=-delta_phi_width*pi/180;
        ZZ_up=delta_phi_width*pi/180;
%     else
%         ZZ_up=3*pi/180;
%         ZZ_down=-3*pi/180;
%     end
    
    
    PHI_result(i,1) =PHI;
    ZZ_result1(i,1) = ZZ;
    ZZ_up_result1(i,1)= ZZ_up;
    ZZ_down_result1(i,1)= ZZ_down;
    
    
    marknofly=0;
    if lamda<lamda_final
        
        if ZZ>ZZ_up&&mark==1
            sgn=-1;
        elseif ZZ<ZZ_down&&mark==1
            sgn=1;
        end
    end
    
    %赋值真实循环控制指令
    sigma=abs(sigma)*sgn;
    
    if sigma>80*pi/180
        sigma=80*pi/180;
    elseif sigma<-80*pi/180
        sigma=-80*pi/180;
    end

    
    if isnan(sigma)
        sigma=sigma_result(i-1,1);
    end
    
    
    if sigma>=2*pi
        sigma=sigma-2*pi;
    elseif sigma<=-2*pi
        sigma=sigma+2*pi;
    end
    
    
    H=r-Re;
    sos = AirSpeedCal(H);
    Mach = V./sos;
    
    rho = AirRhoCal(H);
    Q = 0.5.*rho.*V.*V;
    g=g0*(Re/(Re+H))^2;
    
    t_result(i,1) = t;
    H_result(i,1) = H;
    V_result(i,1) = V;
    gamma_result(i,1) = gamma;
    phi_result(i,1) = phi;
    mass_result(i,1) = mass;
    alpha_result(i,1) = alpha;
    sigma_result(i,1) = sigma;%倾侧角
    lamda_result(i,1) = lamda;
    fai_result(i,1) = fai;
    S_togo_result(i,1) = S_togo;
  
    rangeS_result(i,1) = rangeS;
    e_result(i,1) = e;
    
    
    [CD,CL]=aero_CAV_H(Mach,alpha*180/pi);
    L_D_result(i,1) =CL/CD;
    
    Drag  =0.6*Q.*S.*CD;
    Lift  =0.28*Q.*S.*CL;
    
    
    %拉偏%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Lift=1.0*Lift;%*(1+normrnd(0,0.03));
    Drag=1.0*Drag;%*(1+normrnd(0,0.03));
    L_result(i,1) = Lift;
    D_result(i,1) = Drag;
    
    %后期增设的需要检验是否满足约束的状态
    Q_result(i,1) = Q;
    axial_load(i,1) = Drag/mass;%轴向过载
    nomal_load(i,1) = Lift*sin(sigma)/mass;
    lateral_load(i,1) = Lift*cos(sigma)/mass;
    Qh_result(i,1)=4.186*31500*sqrt(rho/(9.81*0.123*0.053))*((V/7900)^3.15);%热流，0.123后面一项为半径
    
    %积分开始
    rdot=V*sin(gamma);
    lamdadot=V*cos(gamma)*sin(phi)/r/cos(fai);
    faidot=V*cos(gamma)*cos(phi)/r;
    Vdot=-Drag/mass-mu*sin(gamma)/r/r;
    gammadot=Lift.*cos(sigma)/mass/V+V*cos(gamma)/r-mu*cos(gamma)/V/r/r;
    phidot=Lift.*sin(sigma)/mass/V/cos(gamma)+V/r*cos(gamma)*sin(phi)*tan(fai);
    massdot=0;
    
    Vdot_result(i,1) = Vdot;
    
    r=r+rdot*delta_t;
    lamda=lamda+lamdadot*delta_t;
    fai=fai+faidot*delta_t;
    V=V+Vdot*delta_t;
    gamma=gamma+gammadot*delta_t;
    phi=phi+phidot*delta_t;
    mass=mass+massdot*delta_t;
    e=1/(r/(Re+H_all))-V/V_all*V/V_all/2;
    
    
    %%%%%横侧向参数%%%%%%%%
    PHI=pi-asin(sin(lamda_final-lamda)*cos(fai)/sin(S_togo_Z));
    delta_phi=phi-PHI;
    delta_phi_result(i,1)=delta_phi;
    rangeSdot=V*cos(gamma)*Re/r*cos(delta_phi);
    rangeS=rangeS+rangeSdot*delta_t;
    S_togo=S_togo-rangeSdot*delta_t;
    %%%%%%%%%%%%%%%%%%%%%%
    
    CC=sin(pi/2-fai)*sin(pi/2-fai_o)*cos(lamda-lamda_o)+cos(pi/2-fai)*cos(pi/2-fai_o);
    SS=Re*acos(CC);
    if phi<-pi
        phi=2*pi+phi;
    end
    
    t = t+delta_t;
    i = i+1;
end

t_result =  t_result(1:i-1);
t_real_result = t_result+t00;
H_result =  H_result(1:i-1);
V_result =  V_result(1:i-1);
e_result = e_result(1:i-1);
gamma_result = gamma_result(1:i-1);
phi_result = phi_result(1:i-1);
mass_result = mass_result(1:i-1);
alpha_result = alpha_result(1:i-1);
sigma_result = sigma_result(1:i-1);
lamda_result = lamda_result(1:i-1);
fai_result = fai_result(1:i-1);
S_togo_result = S_togo_result(1:i-1);
S_togo_Z_result = S_togo_Z_result(1:i-1);
% Sp_togo_result = Sp_togo_result(1:i-1);
delta_phi_result = delta_phi_result(1:i-1);
ZZ_result1= ZZ_result1(1:i-1);
ZZ_up_result1= ZZ_up_result1(1:i-1);
ZZ_down_result1= ZZ_down_result1(1:i-1);

L_D_result =  L_D_result(1:i-1);
Vdot_result = Vdot_result(1:i-1);
%
Q_result= Q_result(1:i-1);
axial_load= axial_load(1:i-1);
nomal_load = nomal_load(1:i-1);
lateral_load = lateral_load(1:i-1);
Qh_result = Qh_result(1:i-1);
%插值处理
% tt_result= tt_result(1:ii-1);
% ZZ_result= ZZ_result(1:ii-1);
% ZZ_up_result= ZZ_up_result(1:ii-1);
% ZZ_down_result= ZZ_down_result(1:ii-1);
% ZZ_result=interp1(tt_result,ZZ_result,t_result);
% ZZ_up_result=interp1(tt_result,ZZ_up_result,t_result);
% ZZ_down_result=interp1(tt_result,ZZ_down_result,t_result);

    
    CC_target=sin(pi/2-fai_final)*sin(pi/2-fai)*cos(lamda_final-lamda)+cos(pi/2-fai_final)*cos(pi/2-fai);
    S_target=Re*acos(CC_target);
    Data=[t_result H_result V_result e_result mass_result alpha_result sigma_result lamda_result fai_result Q_result axial_load nomal_load lateral_load Qh_result];
    Monte_Carlo{M,1}=Data;
    lamda=lamda_result(i-1);
    fai=fai_result(i-1);
    ReentryTime(M,1)=t_result(i-1)
    V(M,1)=V_result(i-1);
    H(M,1)=H_result(i-1);
%     lamdaf(M,1)=lamda/pi*180
%     faif(M,1)=fai/pi*180
    S_real(M,1)=(acos(sin(fai)*sin(fai_o)+cos(fai)*cos(fai_o)*cos(lamda-lamda_o)))*Re;
    S_aim(M,1)=S_aim;
    CC_target=sin(pi/2-fai_final)*sin(pi/2-fai)*cos(lamda_final-lamda)+cos(pi/2-fai_final)*cos(pi/2-fai);
    S_target(M,1)=Re*acos(CC_target);
    
    lamc=121.57;Hc=0;faic=38.93;
    SL=s0530(lamda_result/pi*180,fai_result/pi*180,lamc,faic);
    
   FlyData=[Data gamma_result phi_result S_real(M,1)*ones(size(t_result)) S_aim(M,1)*ones(size(t_result)) S_target(M,1)*ones(size(t_result)) SL t_real_result];
end

%    save FlyData;



% save Data18
% plotfig
