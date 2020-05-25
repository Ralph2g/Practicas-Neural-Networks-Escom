function guardar_W_b(W_1,W_2,W_s,b_1,b_2,b_s)
    fileID = fopen('W_1.txt','a');
    fprintf(fileID,'%f ',W_1);
    fprintf(fileID,'\n');
    fileID2 = fopen('b_1.txt','a');
    fprintf(fileID2,'%f ',b_1);
    fprintf(fileID2,'\n');
    fclose(fileID);
    fclose(fileID2);
    %Capa 2
    fileID = fopen('W_2.txt','a');
    fprintf(fileID,'%f ',W_2);
    fprintf(fileID,'\n');
    fileID2 = fopen('b_2.txt','a');
    fprintf(fileID2,'%f ',b_2);
    fprintf(fileID2,'\n');
    fclose(fileID);
    fclose(fileID2);
    %Capa 3
    fileID = fopen('W_s.txt','a');
    fprintf(fileID,'%f ',W_s);
    fprintf(fileID,'\n');
    fileID2 = fopen('b_s.txt','a');
    fprintf(fileID2,'%f ',b_s);
    fprintf(fileID2,'\n');
    fclose(fileID);
    fclose(fileID2);
end 