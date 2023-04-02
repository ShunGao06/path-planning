load datad
t00=tm(end);
save t00 t00
% dataNPC=[AirSpeedCal(28000)*6-50,6378145+28000,144.59*pi/180,13.14*pi/180,0,15/180*pi];
% save dataNPC_50 dataNPC
% dataNPC=[AirSpeedCal(28000)*6,6378145+28000,lamdafW2*pi/180,faifW2*pi/180,0,15/180*pi];
% save dataNPC_49 dataNPC
% dataNPC=[AirSpeedCal(28000)*6+50,6378145+28000,144.56*pi/180,faifW1*pi/180,0,15/180*pi];
% save dataNPC_48 dataNPC
% dataNPC=[AirSpeedCal(28000)*6+50,6378145+28000,144.59*pi/180,13.13*pi/180,0,15/180*pi];
% save dataNPC_47 dataNPC
dataNPC=[AirSpeedCal(28000)*6-20,6378145+28010,144.59*pi/180,13.14*pi/180,0,15/180*pi];
save dataNPC_50 dataNPC
dataNPC=[AirSpeedCal(28000)*6,6378145+28020,lamdafW2*pi/180,faifW2*pi/180,0,15/180*pi];
save dataNPC_49 dataNPC
dataNPC=[AirSpeedCal(28000)*6+20,6378145+27980,144.56*pi/180,faifW1*pi/180,0,15/180*pi];
save dataNPC_48 dataNPC
dataNPC=[AirSpeedCal(28000)*6+10,6378145+27990,144.59*pi/180,13.165*pi/180,0,15/180*pi];
save dataNPC_47 dataNPC

% dataEND=[800,6378145+7000,(145.2)*pi/180,(11.92)*pi/180,0,0];
% save dataEND_50 dataEND
% dataEND=[800,6378145+7000,(lamdafW2+0.6)*pi/180,(faifW2-1.25)*pi/180,0,0];
% save dataEND_49 dataEND
% dataEND=[800,6378145+7000,(lamdafW1+0.55)*pi/180,(faifW1-1.3)*pi/180,0,0];
% save dataEND_48 dataEND
% dataEND=[800,6378145+7000,(lamdafW3+0.5)*pi/180,(faifW3-1.35)*pi/180,0,0];
% save dataEND_47 dataEND
dataEND=[800,6378145+7000,(145.2)*pi/180,(11.92)*pi/180,0,0];
save dataEND_50 dataEND
dataEND=[800,6378145+7000,(lamdafW2+0.6)*pi/180,(faifW2-1.25)*pi/180,0,0];
save dataEND_49 dataEND
dataEND=[800,6378145+7000,(lamdafW1+0.55)*pi/180,(faifW1-1.3)*pi/180,0,0];
save dataEND_48 dataEND
dataEND=[800,6378145+7000,(145.1)*pi/180,(11.85)*pi/180,0,0];
save dataEND_47 dataEND


Main_Time_co0501;