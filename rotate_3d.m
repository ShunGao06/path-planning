

axis vis3d;
shading interp;
for i=1:72
camorbit(5,0,'camera')
M=getframe(gcf);
nn=frame2im(M);
[nn,cm]=rgb2ind(nn,256);
if i==1
imwrite(nn,cm,'out.gif','gif','LoopCount',inf,'DelayTime',0.1);%说明loopcount只是在i==1的时候才有用
else
imwrite(nn,cm,'out.gif','gif','WriteMode','append','DelayTime',0.1)%当i>=2的时候loopcount不起作用
end
end