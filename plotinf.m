load Data_Road.mat
figure(2)
HF=[26:0.1:30]';
hl=length(HF);
for o=1:hl
plot3(lamF1,faiF*ones(size(lamF1)),HF(o),'k.');
hold on
plot3(lamF2,faiF*ones(size(lamF2)),HF(o),'k.');
hold on
plot3(lamF*ones(size(faiF1)),faiF1,HF(o),'k.');
hold on
plot3(lamF*ones(size(faiF2)),faiF2,HF(o),'k.');
end
hold off

% for o=1:hl
% line([lamF1,faiF1,HF(o)],[lamF1,faiF2,HF(o)],'k-');
% hold on
% line([lamF1,faiF1,HF(o)],[lamF2,faiF1,HF(o)],'k-');
% hold on
% line([lamF2,faiF1,HF(o)],[lamF2,faiF2,HF(o)],'k-');
% hold on
% line([lamF1,faiF2,HF(o)],[lamF2,faiF2,HF(o)],'k-');
% end
% hold off

