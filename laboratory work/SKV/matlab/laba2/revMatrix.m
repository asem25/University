function [E] = revMatrix(A,N)
[m, n] = size(A);
if m ~= n
    [E] = NaN;
    return
end
E = eye(N); 
for k1 = 1:N
    temp1 = A(k1,k1);
    for j1 = 1:N
        A(k1,j1) = A(k1,j1) / temp1;
        E(k1,j1) = E(k1,j1) / temp1;
    end
    for i1 = (k1+1):N
        temp2 = A(i1,k1);
        for j2 = 1:N
            A(i1,j2) = A(i1,j2) - A(k1,j2)*temp2;
            E(i1,j2) = E(i1,j2) - E(k1,j2)*temp2;
        end
    end
end
for k2 = (N):-1:2
   for i = (k2-1):-1:1
     temp3 = A(i,k2);
      for j = 1:N
         A(i,j) = A(i,j) - A(k2,j)*temp3;
          E(i,j) = E(i,j) - E(k2,j)*temp3;
     end
  end
end
end