function my_comp()
%针对不同的动作采样后的csi package，消除多径效应后，把
csi_m_h=read_bf_file('csi_2017.1.9/corridor/csi-0.8m-h.dat');
csi_m_c=read_bf_file('csi_2017.1.9/corridor/csi-0.8m-c.dat');
csi_m_n=read_bf_file('csi_2017.1.9/corridor/csi-0.8m-n.dat');

csi_trace_h=csi_m_h{5001};
csi_trace_c=csi_m_c{5001};
csi_trace_n=csi_m_n{5001};

csi_h = get_scaled_csi(csi_trace_h);
csi_c = get_scaled_csi(csi_trace_c);
csi_n = get_scaled_csi(csi_trace_n);

csi_h=my_mpath(csi_h);
csi_c=my_mpath(csi_c);
csi_n=my_mpath(csi_n);

csi_h1=squeeze(csi_h(1,:,:));
csi_h2=squeeze(csi_h(2,:,:));
csi_c1=squeeze(csi_c(1,:,:));
csi_c2=squeeze(csi_c(2,:,:));
csi_n1=squeeze(csi_n(1,:,:));
csi_n2=squeeze(csi_n(2,:,:));


subplot(2,3,1);
plot(abs(csi_h1(1,:)));hold on;
plot(abs(csi_c1(1,:)));hold on;
plot(abs(csi_n1(1,:)));hold on;
legend('HENG','CESHEN','NONE');

subplot(2,3,2);
plot(abs(csi_h1(2,:)));hold on;
plot(abs(csi_c1(2,:)));hold on;
plot(abs(csi_n1(2,:)));hold on;
legend('HENG','CESHEN','NONE');

subplot(2,3,3);
plot(abs(csi_h1(3,:)));hold on;
plot(abs(csi_c1(3,:)));hold on;
plot(abs(csi_n1(3,:)));hold on;
legend('HENG','CESHEN','NONE');

subplot(2,3,4);
plot(abs(csi_h2(1,:)));hold on;
plot(abs(csi_c2(1,:)));hold on;
plot(abs(csi_n2(1,:)));hold on;
legend('HENG','CESHEN','NONE');

subplot(2,3,5);
plot(abs(csi_h2(2,:)));hold on;
plot(abs(csi_c2(2,:)));hold on;
plot(abs(csi_n2(2,:)));hold on;
legend('HENG','CESHEN','NONE');

subplot(2,3,6);
plot(abs(csi_h2(3,:)));hold on;
plot(abs(csi_c2(3,:)));hold on;
plot(abs(csi_n2(3,:)));hold on;
legend('HENG','CESHEN','NONE');


end


function ret = my_mpath( raw_csi )
%MY_MPATH 此处显示有关此函数的摘要
%   此处显示详细说明
%对每一个csi packet 进行消除多径效应，最后得到新的csi
csi_new=zeros(2,3,30);
for i=1:1:2
    for j=1:1:3
    temp=ifft(raw_csi(i,j,:));
    temp(5:30)=0;
    csi_new(i,j,:)=fft(temp);
    end
end
ret = csi_new;
end

