function [W,b] = backpropagation(f,theta,bias,s,a,alpha)
    f_n = derivative_m(f,a);
    sen = f_n*theta'*s;
    W = theta-(alpha.*(sen*a'));
    b = bias-alpha.*sen;
end 
