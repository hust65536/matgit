function ret = my_csi(Tx,Rx,n,dataname)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% n is the number of subcarrier

csi_trace=dataname;
% csi_trace = read_bf_file(filename);

N = length(csi_trace);
csi_value = zeros(N,1);
for  i = 1:1:N
    if  isempty(csi_trace{i}) == 1
        i = i-1;
        break;
    else
        csi_entry = csi_trace{i};
        csi = get_scaled_csi(csi_entry);
        csi_value(i) = csi(Tx,Rx,n);
    end
end

%plot(abs(csi_value));
ret = csi_value;

end

