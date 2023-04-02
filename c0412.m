function dataNPC=c0412(lam,fa)

dataNPC=[AirSpeedCal(28000)*6+80,6378145+28000,lam*pi/180,fa*pi/180,0,15/180*pi];

save dataNPC_50 dataNPC

end