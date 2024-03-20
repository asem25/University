function result_matrix = multiply(matrix1, matrix2)
    [m1, n1] = size(matrix1);
    [m2, n2] = size(matrix2);
    if n1 ~= m2
        error('Ошибка в размерности');
    end
    result_matrix = zeros(m1, n2);
    for i = 1:m1
        for j = 1:n2
            for k = 1:n1
                result_matrix(i,j) = result_matrix(i,j) + matrix1(i,k) * matrix2(k,j);
            end
        end
    end
end