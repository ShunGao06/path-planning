

axis vis3d;
shading interp;
for i=1:72
camorbit(5,0,'camera')
M=getframe(gcf);
nn=frame2im(M);
[nn,cm]=rgb2ind(nn,256);
if i==1
imwrite(nn,cm,'out.gif','gif','LoopCount',inf,'DelayTime',0.1);%˵��loopcountֻ����i==1��ʱ�������
else
imwrite(nn,cm,'out.gif','gif','WriteMode','append','DelayTime',0.1)%��i>=2��ʱ��loopcount��������
end
end