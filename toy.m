function y = toy(d,fai)
%toxy 将经纬度转换为地图中的xy 其中地图中单位长度为100km
% 定义参考点：空间中56.18°、43.75°对应（x,y）=(27,27)
fai0=15.081037195430090;
y0=fai0*pi/180*6378145;
y1=fai*pi/180*6378145;
y=round((y1-y0)/d+4);
end