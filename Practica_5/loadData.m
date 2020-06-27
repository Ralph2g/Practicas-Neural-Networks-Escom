clear ; close all; clc
X_all = load("Polinomio_Entrada.txt");
t = load("Polinomio_Target.txt");
%X_all = linspace(-2,2,100)';
%t = 1+sin((pi/4).*X_all);
rang = [-1,1];
R = size(X_all,2);
[p,pval,ptest,t,tval,t_test] = div_dataset(X_all,t);
plot(ptest,t_test, 'yx');
m = length(p);
%v1 =[2];
    v1 =[8 5];
%v2= [3];
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
