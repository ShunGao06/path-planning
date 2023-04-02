%������������� cost��ʾ�ӽڵ㵽��ʼ��Ĵ��ۣ�heuristic��ʾ�ӽڵ㵽��ֹ��Ԥ������
% posinds ��ʾ��չ�������ӽڵ������ֵ

function [cost,heuristic,posinds] = findFValue(posind,costsofar,field,goalind,heuristicmethod,d)
    n = length(field);  % ��ȡ����ĳ���
    [currentpos(1),currentpos(2)] = ind2sub([n n],posind);   %��Ҫ������չ�ĵ㣨Ҳ���Ǹ��ڵ㣩������ֵת��Ϊ������ֵ
    [goalpos(1),goalpos(2)] = ind2sub([n n],goalind);        %����ֹ�������ֵת��Ϊ������ֵ
    cost = Inf*ones(8,1); heuristic = Inf*ones(8,1); pos = ones(8,2); %������cost��heuristic��ʼ��Ϊ8x1�������ֵ�ľ���pos��ʼ��Ϊ8x2��ֵΪ1�ľ���
    % 1�����ڵ�����ҵ�8���ӽڵ㣬pos��������ӽڵ�ĺᡢ������
    
    % ��չ����һ ������չ R
    newx = currentpos(2) - 1; newy = currentpos(1);
    if newx > 0
      pos(1,:) = [newy newx];
      switch lower(heuristicmethod)
        case 'euclidean'
            dx=abs(goalpos(2)-newx);
            dy=abs(goalpos(1)-newy);
          heuristic(1) = d*((dx+dy)+(sqrt(2)-2)*min(dx,dy));
      end
      cost(1) = costsofar + field(newy,newx);
    end

    % ��չ�����   ��  L
    newx = currentpos(2) + 1; newy = currentpos(1);
    if newx <= n
      pos(2,:) = [newy newx];
      switch lower(heuristicmethod)
        case 'euclidean'
          dx=abs(goalpos(2)-newx);
            dy=abs(goalpos(1)-newy);
          heuristic(2) = d*((dx+dy)+(sqrt(2)-2)*min(dx,dy));
      end
      cost(2) = costsofar + field(newy,newx);
    end

    % ��չ������  ��  D   
    newx = currentpos(2); newy = currentpos(1)-1;
    if newy > 0
      pos(3,:) = [newy newx];
      switch lower(heuristicmethod)
        case 'euclidean'
          dx=abs(goalpos(2)-newx);
            dy=abs(goalpos(1)-newy);
          heuristic(3) = d*((dx+dy)+(sqrt(2)-2)*min(dx,dy));
      end
      cost(3) = costsofar + field(newy,newx);
    end

    % ��չ������  ��  U
    newx = currentpos(2); newy = currentpos(1)+1;
    if newy <= n
      pos(4,:) = [newy newx];
      switch lower(heuristicmethod)
        case 'euclidean'
          dx=abs(goalpos(2)-newx);
            dy=abs(goalpos(1)-newy);
          heuristic(4) = d*((dx+dy)+(sqrt(2)-2)*min(dx,dy));
      end
      cost(4) = costsofar + field(newy,newx);
    end
    
     % ��չ������  ����  LD
    newx = currentpos(2) + 1; newy = currentpos(1) - 1;
    if newx <= n && newy > 0
      pos(5,:) = [newy newx];
      switch lower(heuristicmethod)
        case 'euclidean'
          dx=abs(goalpos(2)-newx);
            dy=abs(goalpos(1)-newy);
          heuristic(5) = d*((dx+dy)+(sqrt(2)-2)*min(dx,dy));
      end
      cost(5) = costsofar +sqrt(2)* field(newy,newx);
    end
    
    % ��չ������  ����  LU
    newx = currentpos(2) + 1; newy = currentpos(1) + 1;
    if newx <= n && newy <= n
      pos(6,:) = [newy newx];
      switch lower(heuristicmethod)
        case 'euclidean'
          dx=abs(goalpos(2)-newx);
            dy=abs(goalpos(1)-newy);
          heuristic(6) = d*((dx+dy)+(sqrt(2)-2)*min(dx,dy));
      end
      cost(6) = costsofar +sqrt(2)* field(newy,newx);
    end
    
    % ��չ������  ����  RU
    newx = currentpos(2) - 1; newy = currentpos(1) + 1;
    if newx > 0 && newy <= n
      pos(7,:) = [newy newx];
      switch lower(heuristicmethod)
        case 'euclidean'
          dx=abs(goalpos(2)-newx);
            dy=abs(goalpos(1)-newy);
          heuristic(7) = d*((dx+dy)+(sqrt(2)-2)*min(dx,dy));
      end
      cost(7) = costsofar +sqrt(2)* field(newy,newx);
    end
    
    % ��չ�����  ����  RD
    newx = currentpos(2) - 1; newy = currentpos(1) - 1;
    if newx > 0 && newy > 0
      pos(8,:) = [newy newx];
      switch lower(heuristicmethod)
        case 'euclidean'
          dx=abs(goalpos(2)-newx);
            dy=abs(goalpos(1)-newy);
          heuristic(8) = d*((dx+dy)+(sqrt(2)-2)*min(dx,dy));
      end
      cost(8) = costsofar +sqrt(2)* field(newy,newx);
    end
    
     posinds = sub2ind([n,n],pos(:,1),pos(:,2)); % ����չ�������ӽڵ������ֵת��Ϊ����ֵ
end