function [x, y,cod] = codificador(n)
    x = ones(2^n,n);
    for i=1:n
        pos = 1;
        for j=1:2^(i-1)
            for k=1:2^(n-i)
                x(pos,i) =0;
                pos = pos+1;
            end
            pos = pos+2^(n-i);
        end
    end
    y = 0:(2^n)-1;
    y = y'; 
    cod = [x y];
    dlmwrite('codificador12bits.txt',cod);
end
