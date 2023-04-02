% 生成环境，障碍物，起始点，终止点等的矩阵
function [field, startposind, goalposind, costchart, fieldpointers,faiF1,faiF2,faiF3,faiF4,faiF5,faiF6,lamF1,lamF2,lamF3,lamF4,lamF5,lamF6] = initializeField(d,n)
    % 生成field矩阵
    field = d*ones(n,n);% 设置任意两方格间距离为100km
    
    Y0=tox(d,124.77); X0=toy(d,37.5); 
    Yg=tox(d,144.72); Xg=toy(d,13.43);
%   Y0=tox(d,121); X0=toy(d,33);
%   Yg=tox(d,144.72); Xg=toy(d,13.43);

%     Yg=25;Xg=5;
%     field(ind2sub([n n],ceil(n^2.*rand(n*n*0.05,1)))) = Inf;%向上取整

     XF1=randi([5 25]);
     XF2=XF1+2;
     YF1=XF1+4;
     YF2=XF1+6; % X:30-45  Y:50-55
     
        XF3=randi([10 30]);
     XF4=XF1+2;
     YF3=XF1+4;
     YF4=XF1+6;
     
     
     XF5=randi([20 50]);
     XF6=XF1+2;
     YF5=XF1+4;
     YF6=XF1+6;
     %XF3=14;XF4=15;YF3=17;YF4=18; % X:20-40  Y:23-33
%      XF5=19;XF6=21;YF5=9;YF6=11; % X:20-40  Y:23-33
%      XF7=15;XF8=16;YF7=21;YF8=22;
%      XF9=19;XF10=20;YF9=16;YF10=17;
     
     faiF1=tofai1(d,XF1+1);
     faiF2=tofai1(d,XF2+1);
     lamF1=tolam1(d,YF1+1);
     lamF2=tolam1(d,YF2+1);
     
        faiF3=tofai1(d,XF3+1);
     faiF4=tofai1(d,XF4+1);
     lamF3=tolam1(d,YF3+1);
     lamF4=tolam1(d,YF4+1);
       faiF5=tofai1(d,XF5+1);
     faiF6=tofai1(d,XF6+1);
     lamF5=tolam1(d,YF5+1);
     lamF6=tolam1(d,YF6+1);
     

     field((XF1+1):(XF2),(YF1+1):(YF2)) = Inf;    %  障碍物值为inf
     field((XF3+1):(XF4),(YF3+1):(YF4)) = Inf;    %  障碍物值为inf
     field((XF5+1):(XF6),(YF5+1):(YF6)) = Inf;    %  障碍物值为inf
%      field((XF7+1):(XF8),(YF7+1):(YF8)) = Inf;
%      field((XF9+1):(XF10),(YF9+1):(YF10)) = Inf;

     
    % 生成起始点和终止点
    startposind = sub2ind([n,n],(X0),(Y0));  %生成起始点的索引值 
    goalposind = sub2ind([n,n],(Xg),(Yg));   %生成终止点的索引值  
    field(startposind) = 0; field(goalposind) = 0;  %把矩阵中起始点和终止点处的值设为0
    
    %   生成cost矩阵（cost即为g(n)）
    costchart = NaN*ones(n,n);%生成一个nxn的矩阵costchart，每个元素都设为NaN。就是矩阵初始NaN无效数据
    costchart(startposind) = 0;%在矩阵costchart中将起始点位置处的值设为0
    
    % 生成元胞数组矩阵 fieldpointers
    fieldpointers = cell(n,n);%生成元胞数组n*n
    fieldpointers{startposind} = 'S'; fieldpointers{goalposind} = 'G'; %将元胞数组的起始点的位置处设为 'S'，终止点处设为'G'
    fieldpointers(field==inf)={0};  % 障碍处为0
    
   
end