function [] = guardar_error(err,err_val, e)
    fileID = fopen('error_train.txt','a');
    fprintf(fileID,"%f %f\n",e,err);
    fclose(fileID);
    fileID2 = fopen('error_val.txt','a');
    fprintf(fileID2,"%f %f\n",e,err_val);
    fclose(fileID2);
end