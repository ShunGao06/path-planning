%   һ�����˻�������·����PID���� ����� A_ROAD_BEST �� plot1 ʹ�ã�

clc;         %�������ڵ�����
clear;       %��������ռ�����б�������������MEX�ļ�
close all;   %�ر����е�figure����

%���������趨
n =30;   % ����һ��n x n�ķ����޸Ĵ�ֵ�����޸�����ͼƬ�ķ�����
d=100e3; %�����ľ���Ϊ100km
h=0.1; %���沽��

%�����Լ��ϰ���Ĵ���
[field, startposind, goalposind, costchart, fieldpointers,faiF1,faiF2,faiF3,faiF4,faiF5,faiF6,lamF1,lamF2,lamF3,lamF4,lamF5,lamF6] =initializeField(d,n); %������ɰ����ϰ����ʼ�㣬��ֹ�����Ϣ�ľ���


% ·���滮���õ���һЩ����ĳ�ʼ��
setOpen = [startposind]; setOpenCosts = [0]; setOpenHeuristics = [Inf];

   % setOpen ��Ŵ�ѡ���ӽڵ������ֵ   setOpenCosts ��Ŵ�ѡ�㵽��ʼ��Ĵ��ۣ�  
   % setOpenHeuristics ��Ŵ�ѡ�㵽�յ��Ԥ������

setClosed = []; setClosedCosts = [];

   % setClosed ��һ�ν�����չ�ĸ��ڵ������ֵ  setClosedCosts �õ㵽��ʼ��Ĵ���  ʵ��������������������

movementdirections = {'R','L','D','U','LD','LU','RU','RD'};  %�ƶ�����

axishandle = createFigure(field,costchart);    %��������ɵķ����ϰ������������ͼ��,goalposind);    %��������ɵķ����ϰ������������ͼ��

      [goalposy,goalposx] = ind2sub([n,n],goalposind);
      [startposy,startposx] = ind2sub([n,n],startposind);
     
      h3=plot(startposx,startposy,'cp','MarkerSize',1.5,'LineWidth',6,'DisplayName','���1');
      
       h4=plot(goalposx,goalposy,'gs','MarkerSize',3,'LineWidth',6,'DisplayName','�յ�');
   i=0;
%%
% ���whileѭ���Ǳ�����ĺ��ģ�����ѭ�����е�����Ѱ����ֹ��
while ~max(ismember(setOpen,goalposind)) && ~isempty(setOpen)
    i=i+1;

    [temp, ii] = min(setOpenCosts + setOpenHeuristics);     % iiΪ�ܴ�����С��ֵ�ھ����е�������temp���ܴ�����С��ֵ 
    aa(i)=ii;
    %������������þ��ǰѴ�����С�ĵ�ii��Ϊ���ڵ㣬��չ�ҵ��ӽڵ㣬����ӽڵ�Ĵ���g(n)���Լ��ӽڵ㵽�յ��Ԥ������h(n)
    [costs,heuristics,posinds] = findFValue(setOpen(ii),setOpenCosts(ii), field,goalposind,'euclidean',d);
 
    %  �Ѹ��ڵ�ii����setclosed��
  setClosed = [setClosed; setOpen(ii)];     % ���ҳ�������չ�����ĵ��д�����С���Ǹ��㴮������setClosed �� 
  setClosedCosts = [setClosedCosts; setOpenCosts(ii)];    % ����չ�����ĵ��д�����С���Ǹ���Ĵ��۴�������setClosedCosts ��
  
    % �Ѹ��ڵ�ii��setOpen��ɾ��
  %��������λ�ھ�����ڲ�
  if (ii > 1 && ii < length(setOpen))
    setOpen = [setOpen(1:ii-1); setOpen(ii+1:end)];
    setOpenCosts = [setOpenCosts(1:ii-1); setOpenCosts(ii+1:end)];
    setOpenHeuristics = [setOpenHeuristics(1:ii-1); setOpenHeuristics(ii+1:end)];
    
  %��������λ�ھ����һ��
  elseif (ii == 1)
    setOpen = setOpen(2:end);
    setOpenCosts = setOpenCosts(2:end);
    setOpenHeuristics = setOpenHeuristics(2:end);
    
  %��������λ�ھ�������һ��
  else
    se                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    tOpen = setOpen(1:end-1);
    setOpenCosts = setOpenCosts(1:end-1);
    setOpenHeuristics = setOpenHeuristics(1:end-1);
  end
%%

%%
% ��ii��չ�������ӽڵ��з���Ҫ��ĵ�ŵ�setOpen �����У���Ϊ��ѡ��

  for jj=1:length(posinds)
  
    if ~isinf(costs(jj))   % �жϸõ㣨���񣩴�û���ϰ���
        
      % �жϸõ��Ƿ� �Ѿ�������setOpen �� setClosed ������
      % �������Ҫ�������չ��Ȳ���setOpen ����Ҳ����setClosed ������
      if ~max([setClosed; setOpen] == posinds(jj))
        fieldpointers(posinds(jj)) = movementdirections(jj);
        costchart(posinds(jj)) = costs(jj);
        setOpen = [setOpen; posinds(jj)];
        setOpenCosts = [setOpenCosts; costs(jj)];
        setOpenHeuristics = [setOpenHeuristics; heuristics(jj)];
        
      % �������Ҫ�������չ���Ѿ���setOpen ������
      elseif max(setOpen == posinds(jj))
        I = find(setOpen == posinds(jj));  %  �ҵ�Ҫ����ĵ���setopen�е�λ�ã����ظ�I
        % ���ͨ��Ŀǰ�ķ����ҵ�������㣬��֮ǰ�ķ����ã�����С���͸��������
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
% ����findWayBack��������·�����ݣ������Ƴ�·������
if max(ismember(setOpen,goalposind))
  disp('UAV1''s Solution is found!');
  [p,po] = findWayBack(goalposind,fieldpointers); % ����findWayBack��������·�����ݣ������ݽ�����ھ���P��
  h5=plot(p(:,2),p(:,1),'r','LineWidth',3,'DisplayName',' Best road');  %�� plot��������·������
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

