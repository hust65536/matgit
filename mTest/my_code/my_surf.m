[f0,pxx0]=my_psd(w);
[f1,pxx1]=my_psd(x);
[f2,pxx2]=my_psd(y);
[f3,pxx3]=my_psd(z);

% plot(f1,pxx1);
% hold on;
% plot(f2,pxx2);
% hold on;
% plot(f3,pxx3);
% hold on;
% plot(f0,pxx0);
% hold on;

subplot(4,1,1);
bar(f1,pxx1);
subplot(4,1,2);
bar(f2,pxx2);
subplot(4,1,3);
bar(f3,pxx3);
subplot(4,1,4);
bar(f0,pxx0);
x=norm2rd_1(400:1000);
y=norm2rd_2;
z=norm2rd_4(1400:2000);
w=norm2rd_5(500:1200);
csi_one_1=my_csisum('csi_1s1bu_1.dat');
csi_one_2=my_csisum('csi_1s1bu_2.dat');
csi_one_3=my_csisum('csi_1s1bu_3.dat');
csi_one_4=my_csisum('csi_1s1bu_4.dat');
csi_one_5=my_csisum('csi_1s1bu_5.dat');
csi_one_6=my_csisum('csi_1s1bu_6.dat');

one2rd_1=sum(my_2rd(csi_one_1),1);
one2rd_2=sum(my_2rd(csi_one_2),1);
one2rd_3=sum(my_2rd(csi_one_3),1);
one2rd_4=sum(my_2rd(csi_one_4),1);
one2rd_5=sum(my_2rd(csi_one_5),1);
one2rd_6=sum(my_2rd(csi_one_6),1);

csi_none=my_csisum('csi_none.dat');
none2rd=sum(my_2rd(csi_none),1);

csi_norm=my_csisum('csi_normal.dat');
norm2rd=sum(my_2rd(csi_norm),1);


subplot(4,1,1);
plot(abs(csi_1m_shirt(6,:)));
xlabel('csi 1m shirt')
subplot(4,1,2);
plot(abs(csi_1m_jacket(6,:)));
xlabel('csi 1m jacket')
subplot(4,1,3);
plot(abs(csi_1m_yurong(6,:)));
xlabel('csi 1m yurong')
subplot(4,1,4);
plot(abs(csi_none(6,:)));
xlabel('csi none')

plot(yy_1m(15,:) , lgy_1m(15,:) , wcy_1m(15,:) , no(15,:));

mean_4m=zeros(30,4);
mean_4m(:,1)=mean(csi_4m_shirt,2);
mean_4m(:,2)=mean(csi_4m_jacket,2);
mean_4m(:,3)=mean(csi_4m_yurong,2);
mean_4m(:,4)=mean(csi_none,2);


plot(mean_4m);
legend('T恤','夹克','羽绒服','无人');
xlabel('子载波1~30');
ylabel('信号强度');
title('距离接收端4米');

csi_none = my_csisum('csi_none.dat');
csi_1m_jacket = my_csisum('csi_1m_jacket.dat');
csi_2m_jacket = my_csisum('csi_2m_jacket.dat');
csi_3m_jacket = my_csisum('csi_3m_jacket.dat');
csi_4m_jacket = my_csisum('csi_4m_jacket.dat');
csi_1m_shirt = my_csisum('csi_1m_shirt.dat');
csi_2m_shirt = my_csisum('csi_2m_shirt.dat');
csi_3m_shirt = my_csisum('csi_3m_shirt.dat');
csi_4m_shirt = my_csisum('csi_4m_shirt.dat');
csi_1m_yurong = my_csisum('csi_1m_yurong.dat');
csi_2m_yurong = my_csisum('csi_2m_yurong.dat');
csi_3m_yurong = my_csisum('csi_3m_yurong.dat');
csi_4m_yurong = my_csisum('csi_4m_yurong.dat');



plot(f1,pxx1);
hold on;
plot(f2,pxx2);
hold on;
plot(f0,pxx0);
hold on;
legend('一秒一步','正常行走','无人');
