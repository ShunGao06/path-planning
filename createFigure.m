%利用随机生成的环境数据来进行环境的绘制
function axishandle = createFigure(field,costchart)   %将随机生成的方格及障碍物的数据生成图像

      % 这个if..else结构的作用是判断如果没有打开的figure图，则按照相关设置创建一个figure图
      if isempty(gcbf)                                       %gcbf是当前返回图像的句柄，isempty(gcbf)假如gcbf为空的话，返回的值是1，假如gcbf为非空的话，返回的值是0
      figure('Position',[460 65 700 700]);  %对创建的figure图像进行设置，设置其距离屏幕左侧的距离为450，距离屏幕下方的距离为50，长度和宽度都为700，并且关闭图像的菜单栏
%       , 'MenuBar','none'
      axes('position', [0.00 0.00 1 1]);               %设置坐标轴的位置，左下角的坐标设为0,0   右上角的坐标设为1,1  （可以认为figure图的左下角坐标为0 0   ，右上角坐标为1 1 ）
      else
      gcf; cla;   %gcf 返回当前 Figure 对象的句柄值，然后利用cla语句来清除它
      end
      
      n = length(field);  %获取矩阵的长度，并赋值给变量n
      field(field < Inf) = 0; %将fieid矩阵中的随机数（也就是没有障碍物的位置处）设为0 
      c=[field field(:,end); field(end,:) field(end,end)];
      h1=pcolor(1:n+1,1:n+1,c);%多加了一个重复的（由n X n变为 n+1 X n+1 ）

      
      cmap = flipud(colormap('jet'));  %生成的cmap是一个256X3的矩阵，每一行的3个值都为0-1之间数，分别代表颜色组成的rgb值
      cmap(1,:) = zeros(3,1); cmap(end,:) = ones(3,1); %将矩阵cmap的第一行设为0 ，最后一行设为1
      colormap(flipud(cmap)); %进行颜色的倒转 
      hold on;
      
      axishandle = pcolor(1:n+1,1:n+1,[costchart costchart(:,end); costchart(end,:) costchart(end,end)]);  %将矩阵costchart进行拓展，插值着色后赋给axishandle

       
    
%        Data_Result3 = [h3,h4];
%        save Data_Result3;
%        uicontrol('Style','pushbutton','String','RE-DO', 'FontSize',12, 'Position', [1 1 60 40], 'Callback','astardemo');
end