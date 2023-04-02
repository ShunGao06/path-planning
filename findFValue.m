%函数的输出量中 cost表示子节点到起始点的代价，heuristic表示子节点到终止的预估代价
% posinds 表示拓展出来的子节点的索引值

function [cost,heuristic,posinds] = findFValue(posind,costsofar,field,goalind,heuristicmethod,d)
    n = length(field);  % 获取矩阵的长度
    [currentpos(1),currentpos(2)] = ind2sub([n n],posind);   %将要进行拓展的点（也就是父节点）的索引值转换为成坐标值
    [goalpos(1),goalpos(2)] = ind2sub([n n],goalind);        %将终止点的索引值转换为成坐标值
    cost = Inf*ones(8,1); heuristic = Inf*ones(8,1); pos = ones(8,2); %将矩阵cost和heuristic初始化为8x1的无穷大值的矩阵，pos初始化为8x2的值为1的矩阵
    % 1个父节点可以找到8个子节点，pos用来存放子节点的横、纵坐标
    
    % 拓展方向一 向左拓展 R
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

    % 拓展方向二   右  L
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

    % 拓展方向三  上  D   
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

    % 拓展方向四  下  U
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
    
     % 拓展方向五  右上  LD
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
    
    % 拓展方向六  右下  LU
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
    
    % 拓展方向七  左下  RU
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
    
    % 拓展方向八  左上  RD
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
    
     posinds = sub2ind([n,n],pos(:,1),pos(:,2)); % 将拓展出来的子节点的坐标值转换为索引值
end