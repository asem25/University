function [x, y] = runge_kutta(f, x0, y0, x_end, h)
    % Инициализация массивов x и y
    x = x0:h:x_end;
    y = zeros(1, length(x));
    
    % Начальное условие
    y(1) = y0;

    % Итерационный процесс метода Рунге-Кутты
    for i = 1:(length(x) - 1)
        k1 = f(x(i), y(i));
        k2 = f(x(i) + h/2, y(i) + (h/2) * k1);
        k3 = f(x(i) + h/2, y(i) + (h/2) * k2);
        k4 = f(x(i) + h, y(i) + h * k3);

        y(i + 1) = y(i) + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
    end
end