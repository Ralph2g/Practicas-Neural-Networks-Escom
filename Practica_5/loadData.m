clear ; close all; clc
X_all = load("01_Polinomio_Entrada.txt");
t = load("01_Polinomio_Target.txt");
%X_all = linspace(-2,2,100)';
%t = 1+sin((pi/4).*X_all);
rang = [-2,2];
R = size(X_all,2);
[p,pval,ptest,t,tval,t_test] = div_dataset(X_all,t);
m = length(p);
%v1 =[2];
    v1 =[10 10];
%v2= [2];
    v2 = [2,2];
M = size(v1,2)+1;
Mm = 0:M-1;
v1 = [R v1 1];
v2 = [v2 1];
alpha = .009;
epochMax = 120000;
eepoch = 0.00003;
epochval = floor(linspace(round(epochMax*.1),epochMax,10));
numVal = 3;

save config.mat
