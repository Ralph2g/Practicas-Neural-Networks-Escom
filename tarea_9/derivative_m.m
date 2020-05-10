function f_n = derivative_m(f,a)%neuronas, función
    f_n = eye(size(a,1));%matris SxS 
    switch f
        case 1
            purelin = 1;
            f_n = f_n.*purelin;
        case 2
            for i = 1: size(a,1)
                longsig = (1-a).*a;
                f_n(i,i) = f_n(i,i).*longsig(i);
            end
        case 3
            f_n = f_n;
    end 
end