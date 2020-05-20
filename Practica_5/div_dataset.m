function [p,pval,ptest,t,tval,ttest] = div_dataset(X,y)
    X_all = [X y];
    X_rand = X_all(randperm(size(X_all,1)),:);
    
    num_X = round(size(X_all,1)*.7);% 70%
    num_X_val = round(size(X_all,1)*.15);% 15%
    
    p = X_rand(1:num_X,1);% 70%
    pval = X_rand(num_X+1 : num_X + num_X_val,1);
    ptest = X_rand(num_X + num_X_val+1:end,1);

    t = X_rand(1:num_X,2);
    tval = X_rand(num_X+1 :num_X + num_X_val,2);
    ttest = X_rand(num_X + num_X_val+1:end,2);
end