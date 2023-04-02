%- 4 对象  时间协同 -%
close all
clear
%------- Main -------%

%- 各对象再入时间估算 -%
sigma=60;alpha1=12;
ReentryTime = Untitled0501(alpha1,sigma);

%- 时间协调信息 -%
col_average = mean(ReentryTime,1);
Time_co = col_average(1);


delta=0.5;
time_diff_dot=1;


%- 各对象定时再入 -%
for M= 1:4
    time_require=Time_co
    
    time_error=100;
    S_target=ReentryTime(M,2);
    
    sigmamax=65;%- 走廊宽度上下界（deg）-%
    sigmamin=55;
    alpha1max=14;
    alpha1min=10;
    alpha1=12;
    
    while time_error>1
        while abs(time_diff_dot)>0.01
        FlyData=NPC_coo0501(alpha1,sigma,M);
        FlyData_1=NPC_coo0501(alpha1,sigma+delta,M);
        [row,col]=size(FlyData);
        [row1,col1]=size(FlyData_1);
        time1=FlyData(row,1);
        time1_1=FlyData_1(row1,1);
        time_diff=time1-time_require;
        if abs(time_diff)<1
            break
        end
        time_diff_dot=(time1_1-time1)/delta;
        sigma=sigma-0.2*(time1-time_require)/time_diff_dot;
        if sigma<=sigmamin
            sigma=sigmamin;
        elseif sigma>=sigmamax
            sigma=sigmamax;
        end
        S_target=FlyData(row,col);
        S_real=FlyData(row,(col-2));
        S_aim=FlyData(row,(col-1));
        V=FlyData(row,3);
        end
       time_error=abs(time1-time_require);
    end
            
    while V>810
        alpha1min=alpha1;
        alpha1=(alpha1max+alpha1min)/2;
        FlyData=NPC_coo0501(alpha1,sigma,M);
        [row,col]=size(FlyData);
        time1=FlyData(row,1);
        S_target=FlyData(row,col);
        S_real=FlyData(row,(col-2));
        S_aim=FlyData(row,(col-1));
        V=FlyData(row,3);
        time_error=abs(time1-time_require)
    end
    while V<790
        alpha1max=alpha1;
        alpha1=(alpha1max+alpha1min)/2;
        FlyData=NPC_coo0501(alpha1,sigma,M);
        [row,col]=size(FlyData);
        time1=FlyData(row,1);
        S_target=FlyData(row,col);
        S_real=FlyData(row,(col-2));
        S_aim=FlyData(row,(col-1));
        V=FlyData(row,3);
        time_error=abs(time1-time_require)
    end

    
        filename = [pwd,'\Missle',num2str(M),'.mat'];
        save (filename,'FlyData')
end
    plot_time_coo;
% PNGN_realF;