%% 
% This test function is to check if your calculation of dynamics, i.e., M,
% C, G is correct. If your cacluations are
% correct you should get zero error for M, C, G. Again, this is not a 100% 
% check.
q_test = [0.9134    0.6324    0.0975];
dq_test = [0.2785    0.5469    0.9575];

C_test = [0  -0.132706376041645   1.037364687878396
   0.067578580595352                   0                   0
  -0.301729572401184                   0                   0];

M_test = [ 6.437500000000000  -0.840681276908014   1.019254579560482
          -0.840681276908014   0.437500000000000                   0
          1.019254579560482                   0   0.520625000000000];
G_test = 100 * [-1.067750441505868
            0.101474058206939
            -0.028410069075374];

error_C = round(eval_C(q_test, dq_test) - C_test, 5);
fprintf('error_C: \n');
disp(error_C)


error_M = round(eval_M(q_test) - M_test, 5);
fprintf('error_M: \n');
disp(error_M)

error_G = round(eval_G(q_test) - G_test, 5);
fprintf('error_G: \n');
disp(error_G)