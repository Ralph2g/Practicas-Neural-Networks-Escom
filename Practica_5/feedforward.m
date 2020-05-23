function [a] = feedforward(W,a,b,f)
    switch f
        case 1
             a = purelin(W*a'+b)';
        case 2
            a = logsig(W*a'+b)';
        case 3
            a = tansig(W*a'+b)';
    end
end