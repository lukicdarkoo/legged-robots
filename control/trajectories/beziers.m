function [B] = beziers(p, x)
N = size(p, 2);
B = 0;
for i = 1:N
    B = B + kron((factorial(N) / factorial(i) / factorial(N - i)) * (1 - x) .^ (N - i) .* (x .^ i), p(:, i));
end
end
