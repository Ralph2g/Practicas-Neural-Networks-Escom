W = ones(5,5);
b = zeros(5,1);

W_id = fopen('W.txt','w');
b_id = fopen('b.txt','w');

for i = 1 :size(W,1)
    fprintf(W_id,'%d ',W(i,:));
    fprintf(W_id,'\n');
    fprintf(b_id,'%d ',b(i,:));
    fprintf(b_id,'\n');
end
fclose(W_id);
fclose(b_id);