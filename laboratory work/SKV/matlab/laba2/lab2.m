clc;
clear;
a = [1 2 5 11; 2 -6 -3 8; 3 4 5 1; 7 6 2 20];
b = [7 11 15 -9];
b4 = [7 ; 11 ; 15 ; - 9];


c = revMatrix(a, rank(a));
h = findDeterminant(a);

multiply(b, c)
