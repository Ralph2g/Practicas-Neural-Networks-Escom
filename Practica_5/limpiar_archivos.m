function [] = limpiar_archivos()

    fileID = fopen('error_train.txt','w');
    fclose(fileID);
    fileID2 = fopen('error_val.txt','w');
    fclose(fileID2);
    %capa 1
    fileID = fopen('W_1.txt','w');
    fclose(fileID);
    fileID2 = fopen('b_1.txt','w');
    fclose(fileID2);
    %Capa 2
    fileID = fopen('W_2.txt','w');
    fclose(fileID);
    fileID2 = fopen('b_2.txt','w');
    fclose(fileID2);
    %Capa 3
    fileID = fopen('W_s.txt','w');
    fclose(fileID);
    fileID2 = fopen('b_s.txt','w');
    fclose(fileID2);
end