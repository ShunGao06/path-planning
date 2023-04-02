function S=s0411(lam,fa,lamf,faf)

S=6378145*acos(cos(faf/180*pi)*cos(fa/180*pi)*cos(lamf/180*pi-lam/180*pi)+sin(faf/180*pi)*sin(fa/180*pi));

end