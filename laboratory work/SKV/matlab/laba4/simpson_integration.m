function integral = simpson_integration(f, a, b, h)
    n = 2;

    I_current = simp(f, a, b, n);
    
    while true        
        n = n * 2;
        I_next = simp(f, a, b, n);
        if abs(I_next - I_current) < h
            break;
        end
        I_current = I_next;
    end
   
    integral = I_next;
end

% Симпсон
function I = simp(f, a, b, n)
    if mod(n, 2) == 1
        error('n должно быть четным');
    end
    
    h = (b - a) / n;
    x = a:h:b;
    y = f(x);
    
    I = h/3 * (y(1) + y(end) + 4*sum(y(2:2:end-1)) + 2*sum(y(3:2:end-2)));
end