%����������ɵĻ������������л����Ļ���
function axishandle = createFigure(field,costchart)   %��������ɵķ����ϰ������������ͼ��

      % ���if..else�ṹ���������ж����û�д򿪵�figureͼ������������ô���һ��figureͼ
      if isempty(gcbf)                                       %gcbf�ǵ�ǰ����ͼ��ľ����isempty(gcbf)����gcbfΪ�յĻ������ص�ֵ��1������gcbfΪ�ǿյĻ������ص�ֵ��0
      figure('Position',[460 65 700 700]);  %�Դ�����figureͼ��������ã������������Ļ���ľ���Ϊ450��������Ļ�·��ľ���Ϊ50�����ȺͿ�ȶ�Ϊ700�����ҹر�ͼ��Ĳ˵���
%       , 'MenuBar','none'
      axes('position', [0.00 0.00 1 1]);               %�����������λ�ã����½ǵ�������Ϊ0,0   ���Ͻǵ�������Ϊ1,1  ��������Ϊfigureͼ�����½�����Ϊ0 0   �����Ͻ�����Ϊ1 1 ��
      else
      gcf; cla;   %gcf ���ص�ǰ Figure ����ľ��ֵ��Ȼ������cla����������
      end
      
      n = length(field);  %��ȡ����ĳ��ȣ�����ֵ������n
      field(field < Inf) = 0; %��fieid�����е��������Ҳ����û���ϰ����λ�ô�����Ϊ0 
      c=[field field(:,end); field(end,:) field(end,end)];
      h1=pcolor(1:n+1,1:n+1,c);%�����һ���ظ��ģ���n X n��Ϊ n+1 X n+1 ��

      
      cmap = flipud(colormap('jet'));  %���ɵ�cmap��һ��256X3�ľ���ÿһ�е�3��ֵ��Ϊ0-1֮�������ֱ������ɫ��ɵ�rgbֵ
      cmap(1,:) = zeros(3,1); cmap(end,:) = ones(3,1); %������cmap�ĵ�һ����Ϊ0 �����һ����Ϊ1
      colormap(flipud(cmap)); %������ɫ�ĵ�ת 
      hold on;
      
      axishandle = pcolor(1:n+1,1:n+1,[costchart costchart(:,end); costchart(end,:) costchart(end,end)]);  %������costchart������չ����ֵ��ɫ�󸳸�axishandle

       
    
%        Data_Result3 = [h3,h4];
%        save Data_Result3;
%        uicontrol('Style','pushbutton','String','RE-DO', 'FontSize',12, 'Position', [1 1 60 40], 'Callback','astardemo');
end