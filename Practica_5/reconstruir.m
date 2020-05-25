function W = reconstruir(w,c)
    r = size(w,2)/c;
    W = zeros(r,c);
    aux = 1;
    for i =1: size(w,2)
        for j =1: c
            W(i,j) = w(aux);
            aux = aux+1;
        end
    end
end