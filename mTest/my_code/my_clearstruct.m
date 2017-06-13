function csioutput = my_clearstruct( csiinput )
%MY_CLEARSTRUCT �˴���ʾ�йش˺����ժҪ
%   �˴���ʾ��ϸ˵��  
%�˺�������������Tx*Rx����ָ����size ��cell�����˺�ֻʣ����Щstruct�е�
%csi��2*3����3*3��
Tx=2;
N=length(csiinput);
csioutput=cell(N,1);
flag=1;
    for ii = 1:1:N
        cc = get_scaled_csi(csiinput{ii});
        if size(cc,1) == Tx
            csioutput(flag,1)=csiinput(ii);
            flag = flag+1;
        else
            continue;
        end
    end
 csioutput(cellfun(@isempty,csioutput))=[];  
 
end

