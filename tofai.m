function fai = tofai(d,X)
%toxy ����γ��ת��Ϊ��ͼ�е�xy ���е�ͼ�е�λ����Ϊ100km
% ����ο��㣺�ռ���1.436730064464512e+02��15.081037195430090���Ӧ��x,y��=(27,5)
fai0=15.081037195430090;
Re=6378145;
X0=4*d;
fai=fai0+(X-X0)/Re*180/pi;
end