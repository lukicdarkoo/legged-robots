function V = energy_V_tmp(g,l1,l2,l3,m1,m2,m3,q1,q2,q3)
%ENERGY_V_TMP
%    V = ENERGY_V_TMP(G,L1,L2,L3,M1,M2,M3,Q1,Q2,Q3)

%    This function was generated by the Symbolic Math Toolbox version 8.1.
%    05-Nov-2018 22:04:05

t2 = cos(q1);
t3 = l1.*t2;
V = g.*m2.*(t3-l2.*cos(q2).*(1.0./2.0))+g.*m3.*(t3+l3.*cos(q3).*(1.0./2.0))+g.*l1.*m1.*t2.*(1.0./2.0);
