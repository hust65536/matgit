function ret = my_read_task()
    csi_trace = read_bf_file('/home/lgy/csinone_2.dat');
    ret = csi_trace;
    disp(['numer...',num2str(length(csi_trace))]);
end
