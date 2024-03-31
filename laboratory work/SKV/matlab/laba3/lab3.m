clc;
clear;
f =@(x) 3 - sqrt(x) - 0.5 * log(x);  
newtonMethod(f, 0.2 ,0.0006, 10)