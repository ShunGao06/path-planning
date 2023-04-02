%   一架无人机的最优路径及PID跟踪 （结合 A_ROAD_BEST 和 plot1 使用）

clc;         %清除命令窗口的内容
clear;       %清除工作空间的所有变量，函数，和MEX文件
close all;   %关闭所有的figure窗口

%方格数的设定
n =30;   % 产生一个n x n的方格，修改此值可以修改生成图片的方格数
d=100e3; %方格间的距离为100km
h=0.1; %仿真步长

%方格以及障碍物的创建
[field, startposind, goalposind, costchart, fieldpointers,faiF1,faiF2,faiF3,faiF4,faiF5,faiF6,lamF1,lamF2,lamF3,lamF4,lamF5,lamF6] =initializeField(d,n); %随机生成包含障碍物，起始点，终止点等信息的矩阵


% 路径规划中用到的一些矩阵的初始化
setOpen = [startposind]; setOpenCosts = [0]; setOpenHeuristics = [Inf];

   % setOpen 存放待选的子节点的索引值   setOpenCosts 存放待选点到起始点的代价；  
   % setOpenHeuristics 存放待选点到终点的预估代价

setClosed = []; setClosedCosts = [];

   % setClosed 下一次进行拓展的父节点的索引值  setClosedCosts 该点到起始点的代价  实际上这两个矩阵不起作用

movementdirections = {'R','L','D','U','LD','LU','RU','RD'};  %移动方向

axishandle = createFigure(field,costchart);    %将随机生成的方格及障碍物的数据生成图像,goalposind);    %将随机生成的方格及障碍物的数据生成图像

      [goalposy,goalposx] = ind2sub([n,n],goalposind);
      [startposy,startposx] = ind2sub([n,n],startposind);
     
      h3=plot(startposx,startposy,'cp','MarkerSize',1.5,'LineWidth',6,'DisplayName','起点1');
      
       h4=plot(goalposx,goalposy,'gs','MarkerSize',3,'LineWidth',6,'DisplayName','终点');
   i=0;
%%
% 这个while循环是本程序的核心，利用循环进行迭代来寻找终止点
while ~max(ismember(setOpen,goalposind)) && ~isempty(setOpen)
    i=i+1;

    [temp, ii] = min(setOpenCosts + setOpenHeuristics);     % ii为总代价最小的值在矩阵中的行数，temp是总代价最小的值 
    aa(i)=ii;
    %这个函数的作用就是把代价最小的点ii作为父节点，拓展找到子节点，算出子节点的代价g(n)，以及子节点到终点的预估代价h(n)
    [costs,heuristics,posinds] = findFValue(setOpen(ii),setOpenCosts(ii), field,goalposind,'euclidean',d);
 
    %  把父节点ii放入setclosed中
  setClosed = [setClosed; setOpen(ii)];     % 将找出来的拓展出来的点中代价最小的那个点串到矩阵setClosed 中 
  setClosedCosts = [setClosedCosts; setOpenCosts(ii)];    % 将拓展出来的点中代价最小的那个点的代价串到矩阵setClosedCosts 中
  
    % 把父节点ii从setOpen中删除
  %如果这个点位于矩阵的内部
  if (ii > 1 && ii < length(setOpen))
    setOpen = [setOpen(1:ii-1); setOpen(ii+1:end)];
    setOpenCosts = [setOpenCosts(1:ii-1); setOpenCosts(ii+1:end)];
    setOpenHeuristics = [setOpenHeuristics(1:ii-1); setOpenHeuristics(ii+1:end)];
    
  %如果这个点位于矩阵第一行
  elseif (ii == 1)
    setOpen = setOpen(2:end);
    setOpenCosts = setOpenCosts(2:end);
    setOpenHeuristics = setOpenHeuristics(2:end);
    
  %如果这个点位于矩阵的最后一行
  else
    se                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    tOpen = setOpen(1:end-1);
    setOpenCosts = setOpenCosts(1:end-1);
    setOpenHeuristics = setOpenHeuristics(1:end-1);
  end
%%

%%
% 把ii拓展出来的子节点中符合要求的点放到setOpen 矩阵中，作为待选点

  for jj=1:length(posinds)
  
    if ~isinf(costs(jj))   % 判断该点（方格）处没有障碍物
        
      % 判断该点是否 已经存在于setOpen 和 setClosed 矩阵中
      % 如果我们要处理的拓展点既不在setOpen 矩阵，也不在setClosed 矩阵中
      if ~max([setClosed; setOpen] == posinds(jj))
        fieldpointers(posinds(jj)) = movementdirections(jj);
        costchart(posinds(jj)) = costs(jj);
        setOpen = [setOpen; posinds(jj)];
        setOpenCosts = [setOpenCosts; costs(jj)];
        setOpenHeuristics = [setOpenHeuristics; heuristics(jj)];
        
      % 如果我们要处理的拓展点已经在setOpen 矩阵中
      elseif max(setOpen == posinds(jj))
        I = find(setOpen == posinds(jj));  %  找到要处理的点在setopen中的位置，返回给I
        % 如果通过目前的方法找到的这个点，比之前的方法好（代价小）就更新这个点
        if setOpenCosts(I) > costs(jj)
          costchart(setOpen(I)) = costs(jj);
          setOpenCosts(I) = costs(jj);
          setOpenHeuristics(I) = heuristics(jj);
          fieldpointers(setOpen(I)) = movementdirections(jj);
        end
        
        
      end
    end
  end
  
  if isempty(setOpen) 
      break; 
  end
  set(axishandle,'CData',[costchart costchart(:,end); costchart(end,:) costchart(end,end)]);
  set(gca,'CLim',[0 1.1*max(costchart(find(costchart < Inf)))]);

  drawnow; 
end


%%
% 调用findWayBack函数进行路径回溯，并绘制出路径曲线
if max(ismember(setOpen,goalposind))
  disp('UAV1''s Solution is found!');
  [p,po] = findWayBack(goalposind,fieldpointers); % 调用findWayBack函数进行路径回溯，将回溯结果放于矩阵P中
  h5=plot(p(:,2),p(:,1),'r','LineWidth',3,'DisplayName',' Best road');  %用 plot函数绘制路径曲线
%  legend(h5,'Location','NorthEastOutside');

  drawnow;
  drawnow;
 
elseif isempty(setOpen)
  disp('No Solution!'); 
end

 set(axishandle,'CData',[]);
% legend([h3 h4 h5],'Location','NorthEastOutside');
legend([h3 h4 h5]);

%%

Data_Result1 = [p];
Data_Result2 = [n];
% faiF1=faiF1-1;
% faiF2=faiF2-1;
% lamF1=lamF1;
% lamF2=lamF2;
faiF=[faiF1:(faiF2-faiF1)/20:faiF2]';
lamF=[lamF1:(lamF2-lamF1)/20:lamF2]';


save Data_Road;
% plotinf;
axaycontrol;

