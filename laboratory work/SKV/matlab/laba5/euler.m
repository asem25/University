function [x, y] = euler(f, x0, y0, x_end, h)
    % Инициализация массивов x и y
    x = x0:h:x_end;
    y = zeros(1, length(x));
    
    % Начальное условие
    y(1) = y0;

    % Итерационный процесс метода Эйлера
    for i = 1:(length(x) - 1)
        y(i + 1) = y(i) + h * f(x(i), y(i));
    end
end
