% ���ɻ������ϰ����ʼ�㣬��ֹ��ȵľ���
function [field, startposind, goalposind, costchart, fieldpointers,faiF1,faiF2,faiF3,faiF4,faiF5,faiF6,lamF1,lamF2,lamF3,lamF4,lamF5,lamF6] = initializeField(d,n)
    % ����field����
    field = d*ones(n,n);% ������������������Ϊ100km
    
    Y0=tox(d,124.77); X0=toy(d,37.5); 
    Yg=tox(d,144.72); Xg=toy(d,13.43);
%   Y0=tox(d,121); X0=toy(d,33);
%   Yg=tox(d,144.72); Xg=toy(d,13.43);

%     Yg=25;Xg=5;
%     field(ind2sub([n n],ceil(n^2.*rand(n*n*0.05,1)))) = Inf;%����ȡ��

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
     

     field((XF1+1):(XF2),(YF1+1):(YF2)) = Inf;    %  �ϰ���ֵΪinf
     field((XF3+1):(XF4),(YF3+1):(YF4)) = Inf;    %  �ϰ���ֵΪinf
     field((XF5+1):(XF6),(YF5+1):(YF6)) = Inf;    %  �ϰ���ֵΪinf
%      field((XF7+1):(XF8),(YF7+1):(YF8)) = Inf;
%      field((XF9+1):(XF10),(YF9+1):(YF10)) = Inf;

     
    % ������ʼ�����ֹ��
    startposind = sub2ind([n,n],(X0),(Y0));  %������ʼ�������ֵ 
    goalposind = sub2ind([n,n],(Xg),(Yg));   %������ֹ�������ֵ  
    field(startposind) = 0; field(goalposind) = 0;  %�Ѿ�������ʼ�����ֹ�㴦��ֵ��Ϊ0
    
    %   ����cost����cost��Ϊg(n)��
    costchart = NaN*ones(n,n);%����һ��nxn�ľ���costchart��ÿ��Ԫ�ض���ΪNaN�����Ǿ����ʼNaN��Ч����
    costchart(startposind) = 0;%�ھ���costchart�н���ʼ��λ�ô���ֵ��Ϊ0
    
    % ����Ԫ��������� fieldpointers
    fieldpointers = cell(n,n);%����Ԫ������n*n
    fieldpointers{startposind} = 'S'; fieldpointers{goalposind} = 'G'; %��Ԫ���������ʼ���λ�ô���Ϊ 'S'����ֹ�㴦��Ϊ'G'
    fieldpointers(field==inf)={0};  % �ϰ���Ϊ0
    
   
end