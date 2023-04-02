x=pp(:,1);
N=length(x);
a1=zeros(size(x));
b1=zeros(size(x));
c1=zeros(size(x));
d1=zeros(size(x));
% e1=zeros(size(x));
% e1(i)=(4*x(i)+x(i+1))/5;
for i=1:(N-1)
    a1(i)=(4*x(i)+1*x(i+1))/5;
    b1(i)=(3*x(i)+2*x(i+1))/5;
    c1(i)=(2*x(i)+3*x(i+1))/5;
    d1(i)=(1*x(i)+4*x(i+1))/5;
end
xx=x';
aa1=a1';
bb1=b1';
cc1=c1';
dd1=d1';
xxx=[xx;aa1;bb1;cc1;dd1];
s=(N-1)*4+N;
XXcL=reshape(xxx,[],1);
XXXcL=XXcL(1:s);

    