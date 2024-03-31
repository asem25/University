function integral = trapezoidal_integration(f, a, b, h)
    n = 2;
    I_current = trape_integration(f, a, b, n);
    n = 3;
    I_next = trape_integration(f, a, b, n);
    
    while abs(I_next - I_current) > h
        I_current = I_next;
        n = n * 2;
        I_next = 0;
    end

    integral = I_next;

    function integral = trape_integration(f, a, b, n)
    h = (b - a) / n;
    result = 0.5 * (f(a) + f(b));
    for i = 1:n-1
        x = a + i * h;
        result = result + f(x);
    end
    result = result * h;
    integral = result;
end
end