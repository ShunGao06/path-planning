function x = tox(d,lam)
%toxy ����γ��ת��Ϊ��ͼ�е�xy ���е�ͼ�е�λ����Ϊ100km
% ����ο��㣺�ռ���1.436730064464512e+02��15.081037195430090���Ӧ��x,y��=(27,5)
lam0=1.436730064464512e+02;
x0=lam0*pi/180*6378145;
x1=lam*pi/180*6378145;
x=round((x1-x0)/d+27);
end
