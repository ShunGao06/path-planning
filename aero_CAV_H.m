function [cx,cy] = aero_CAV_H(Ma,alpha)

% A = 0.48387 m^2
% m = 907kg

if Ma<3.5
    Ma=3.5;
elseif Ma>23
    Ma=23;
end


if alpha<10
    alpha=10;
end


mzdata = [
3.5	10	0.45	0.2045
3.5	15	0.74	0.296
3.5	20	1.05	0.477
5	10	0.425	0.17
5	15	0.7	0.263
5	20	1	0.423
8	10	0.4	0.129
8	15	0.67	0.224
8	20	0.95	0.354
10	10	0.38	0.109
10	15	0.63	0.197
10	20	0.9	0.31
15	10	0.37	0.109
15	15	0.6	0.195
15	20	0.85	0.305
20	10	0.36	0.109
20	15	0.57	0.192
20	20	0.8	0.3
23	10	0.35	0.109
23	15	0.557	0.192
23	20	0.78	0.3
];

Ma1 = reshape(mzdata(:,1),3,7);
alpha1 = reshape(mzdata(:,2),3,7);
cy1 = reshape(mzdata(:,3),3,7);
cx1 = reshape(mzdata(:,4),3,7);


cx = interpn(alpha1,Ma1,cx1,alpha,Ma,'linear');
cy = interpn(alpha1,Ma1,cy1,alpha,Ma,'linear');

end

