X_all = load("01_Polinomio_Entrada.txt");
t = load("01_Polinomio_Target.txt");
rang = [-2,2];
R = size(X_all,2);
[p,pval,ptest,t,tval,ttest] = div_dataset(X_all,t);
v1 =[3];
    %v1 =[2 3];
v2= [2];
    %v2 = [3,2];
M = size(v1,2)+1;
Mm = 0:M-1;
v1 = [R v1 1];
v2 = [v2 1];
alpha = .01;
epochMax = 300;
eepoch = 0.0009;
epochval = round(epochMax*.1);
numVal = 3;

save config.mat