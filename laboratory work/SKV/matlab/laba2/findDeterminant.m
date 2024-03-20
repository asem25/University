function determinant = findDeterminant(matrix)
[m,n] = size(matrix);
if m ~= n
    determinant = NaN;
    return
end
if n == 1
    determinant = matrix(1,1);
elseif n == 2
    determinant = matrix(1,1)*matrix(2,2) - matrix(1,2)*matrix(2,1);
else
    determinant = 0;
    for i = 1:n
        subMatrix = matrix;
        subMatrix(1,:) = [];
        subMatrix(:,i) = [];
        determinant = determinant + matrix(1,i)*(-1)^(1+i)*findDeterminant(subMatrix);
    end
end
end