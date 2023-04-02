function [XXXcL] = reY(pp)
x=pp(:,2);
k=10;
N=length(x);
a1=zeros(size(x));
b1=zeros(size(x));
c1=zeros(size(x));
d1=zeros(size(x));
e1=zeros(size(x));
f1=zeros(size(x));
g1=zeros(size(x));
h1=zeros(size(x));
i1=zeros(size(x));
for i=1:(N-1)
    a1(i)=(9*x(i)+1*x(i+1))/k;
    b1(i)=(8*x(i)+2*x(i+1))/k;
    c1(i)=(7*x(i)+3*x(i+1))/k;
    d1(i)=(6*x(i)+4*x(i+1))/k;
    e1(i)=(5*x(i)+5*x(i+1))/k;
    f1(i)=(4*x(i)+6*x(i+1))/k;
    g1(i)=(3*x(i)+7*x(i+1))/k;
    h1(i)=(2*x(i)+8*x(i+1))/k;
    i1(i)=(1*x(i)+9*x(i+1))/k;
end
xx=x';
aa1=a1';
bb1=b1';
cc1=c1';
dd1=d1';
ee1=e1';
ff1=f1';
gg1=g1';
hh1=h1';
ii1=i1';
xxx=[xx;aa1;bb1;cc1;dd1;ee1;ff1;gg1;hh1;ii1];
s=(N-1)*9+N;
XXcL=reshape(xxx,[],1);
XXXcL=XXcL(1:s);

end

