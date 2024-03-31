clc;
clear;
f = @(x, y) exp(-y) + exp(x) - 2;

x0 = 0;
y0 = 0;

h = 0.1;
x_end = 6;
[x_euler, y_euler] = euler(f,x0, y0, x_end, h);
[x_runge, y_runge] = runge_kutta(f,x0,  y0, x_end, h);

plot(x_euler, y_euler, 'b.-', x_runge, y_runge, 'ro-');
legend('Метод Эйлера', 'Метод Рунге-Кутты');
xlabel('x');
ylabel('y');
grid on;