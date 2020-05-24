function [f_d] = derivate(f,S,a) %return de identity matrix of the activation function
    f_d = eye(S);
    switch f
        case 1
        case 2
            for i = 1:S
                f_d(i,i) = ((1 - a(i)).* a(i));
            end
        case 3
            for i = 1:S
                f_d(i,i) = (1 - (a(i).^2));
            end
    end
end 