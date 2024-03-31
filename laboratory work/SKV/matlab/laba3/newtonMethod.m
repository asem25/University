function root = newtonMethod(f,  stepSize, tol, max_iter)
    % f - функция, корень которой нужно найти
    % stepSize - размер постоянного шага итерации
    % tol - допустимая погрешность
    % max_iter - максимальное количество итераций


    % поиск начального приближения
   function x0 = autoInitialGuess(f, a, b)
    

    dx = 1e-6; 
    n = 100; 

    x = linspace(a, b, n); 

    
    for i = 1:n
        f1 = numericalDerivative1(f, x(i), dx);
        f2 = numericalDerivative2(f, x(i), dx);

        % Проверяем условия на знак второй производной и ненулевую первую производную
        if f2 > 0 && abs(f1) > 1e-6
            x0 = x(i);
            return;
        end
    end

    error('Не удалось найти подходящее начальное приближение в заданном интервале.');

end

   x0 = autoInitialGuess(f, -10, 10);
   h = sqrt(eps); % шаг для численного дифференцирования
   function dfx = numericalDerivative1(f, x, h)
        dfx = (f(x + h) - f(x - h)) / (h);
   end
   function ddfx = numericalDerivative2(f, x, h)
        ddfx = (f(x + h) - 2 * f(x) + f(x - h)) / (h^2);
   end
   dfx0 = numericalDerivative1(f, x0, h);
   ddfx0 = numericalDerivative2(f, x0, h);
   if abs(dfx0) < tol
        error('Первая производная близка к нулю в начальной точке.');
   end
   if ddfx0 == 0
        error('Вторая производная в начальной точке равна нулю');
   end
    
    % метод Ньютона с постоянным шагом
    for i = 1:max_iter
        fx = f(x0);
        fxh = f(x0 + stepSize);
        
        x1 = x0 - (stepSize * fx)/(fxh - fx);
        
    
        if abs(x1 - x0) < tol
            root = x1;
            return;
        end
        
        
        x0 = x1;
    end
    
    
    error('Достигнуто максимальное количество итераций. Решение не найдено.');
end