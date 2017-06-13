function ret = my_csisum(filename)
%main function
%output the sums of csi subcarriers of 1~6,7~12...
filename = strcat('/home/lgy/',filename);
N= length(my_csi(1,filename));
% A = zeros(5,N);
csi_filtered = zeros(30,N);
csi_i = [];
raw_csi = [];
for i = 1:1:30
    raw_csi = my_csi(i,filename);
    csi_i = my_bandfilter( raw_csi );
    csi_filtered(i,:) = csi_i;
end
%     
% A = reshape(sum(reshape(csi_filtered,6,[])),[],size(A,2))

ret = csi_filtered ;

end

