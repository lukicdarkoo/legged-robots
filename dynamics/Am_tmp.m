function A_m = Am_tmp(l1,l2,l3,m,m3,q1_m,q2_m,q3_m)
%AM_TMP
%    A_M = AM_TMP(L1,L2,L3,M,M3,Q1_M,Q2_M,Q3_M)

%    This function was generated by the Symbolic Math Toolbox version 8.1.
%    16-Jan-2019 15:00:30

t2 = q1_m-q2_m;
t3 = cos(t2);
t4 = l1.^2;
t5 = m.*t4.*(1.0./4.0);
t6 = q1_m-q3_m;
t7 = cos(t6);
t8 = l3.^2;
A_m = reshape([t5-l1.*l2.*m.*t3-l1.*l2.*m3.*t3-l1.*l3.*m3.*t7.*(1.0./2.0),t5,l1.*l3.*m3.*t7.*(-1.0./2.0),l2.^2.*m.*(1.0./4.0),0.0,0.0,m3.*t8.*(-1.0./4.0)-l2.*l3.*m3.*cos(q2_m-q3_m).*(1.0./2.0),0.0,m3.*t8.*(-1.0./4.0)],[3,3]);
