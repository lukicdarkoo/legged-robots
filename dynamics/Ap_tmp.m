function A_p = Ap_tmp(l1,l2,l3,m,m3,q1_p,q2_p,q3_p)
%AP_TMP
%    A_P = AP_TMP(L1,L2,L3,M,M3,Q1_P,Q2_P,Q3_P)

%    This function was generated by the Symbolic Math Toolbox version 8.1.
%    05-Nov-2018 21:43:02

t2 = l1.^2;
t3 = q1_p-q2_p;
t4 = cos(t3);
t5 = l1.*l2.*m.*t4.*(1.0./2.0);
t6 = q1_p-q3_p;
t7 = cos(t6);
t8 = l2.^2;
t9 = l3.^2;
A_p = reshape([t5-m.*t2.*(5.0./4.0)-m3.*t2-l1.*l3.*m3.*t7.*(1.0./2.0),t5,l1.*l3.*m3.*t7.*(-1.0./2.0),t5-m.*t8.*(1.0./4.0),m.*t8.*(-1.0./4.0),0.0,m3.*t9.*(-1.0./4.0)-l1.*l3.*m3.*t7.*(1.0./2.0),0.0,m3.*t9.*(-1.0./4.0)],[3,3]);
