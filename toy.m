function y = toy(d,fai)
%toxy ����γ��ת��Ϊ��ͼ�е�xy ���е�ͼ�е�λ����Ϊ100km
% ����ο��㣺�ռ���56.18�㡢43.75���Ӧ��x,y��=(27,27)
fai0=15.081037195430090;
y0=fai0*pi/180*6378145;
y1=fai*pi/180*6378145;
y=round((y1-y0)/d+4);
end