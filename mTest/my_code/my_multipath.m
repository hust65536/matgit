function csi_dft = my_multipath(csi_raw)
%MY_MULTIPATH 通过ifft，fft减弱多晶效应
%   �˴���ʾ��ϸ˵��
N = size(csi_raw,4);
csi_dft = zeros(2,3,30,N);
for ii = 1:1:N
    cc=squeeze(csi_raw(:,:,:,ii));
    for Tx = 1:1:2
        for Rx = 1:1:3
         cctemp=squeeze(cc(Tx,Rx,:));
         cctemp=ifft(cctemp);
         cctemp(8:30)=0;
         cctemp(1)=0;
         cctemp=fft(cctemp); 
         cc_ret(Tx,Rx,:)=cctemp;
        end
    end
    csi_dft(:,:,:,ii)=cc_ret;
end



end

