clc;
clear;
f = @(x) x.*x .* (1 + log(x));
a = 1.5;
b = 3;
h = 0.0025;

trapezoidal_integration(f, a, b, h)
simpson_integration(f, a, b, h)


