function csi_2rd = my_gait(csitrace)
%MY_GAIT 判断用户的行走脚步

Tx=2;
N=length(csitrace);
csioutput=cell(N,1);
flag=1;
    for ii = 1:1:N
        cc = get_scaled_csi(csitrace{ii});
        if size(cc,1) == Tx
            csioutput(flag,1)=csitrace(ii);
            flag = flag+1;
        else
            continue;
        end
    end

csioutput(cellfun(@isempty,csioutput))=[];
%��ȡÿһ��csitrace�е�csi��Ϣ�������trace

N=length(csioutput);
csi_raw = zeros(2,3,30,N);
for ii =1:1:N
    csientry=csioutput{ii};
    cc=get_scaled_csi(csientry);
    csi_raw(:,:,:,ii)=cc;
end

% csi_dft = my_multipath(csi_raw);

csi_filter=my_filter(csi_raw);

csi_2rd=my_2rd(csi_filter);






end

