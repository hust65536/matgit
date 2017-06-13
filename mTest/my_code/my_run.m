
ii =1;
pks_flag1=zeros(181,1);
pks_flag2=zeros(181,1);
% ift=zeros(3,30);
while(1)
    if  size(csi_trace,1)==0
        pause(1);
        disp(['waiting for csi data...'])
        
    elseif  isempty(csi_trace{ii}) == 1
        pause(1);
        disp(['waiting for csi data...'])
    else
        csi_entry=csi_trace(ii);
%         csi=get_scaled_csi(csi_entry{1});
%         ift(1,:)=ifft(csi(1,1,:));
%         ift(2,:)=ifft(csi(1,2,:));
%         ift(3,:)=ifft(csi(1,3,:));
%         ift(:,5:30)=0;
%         csi(1,1,:)=fft(ift(1,1,:));
%         csi(1,2,:)=fft(ift(1,2,:));
%         csi(1,3,:)=fft(ift(1,3,:));
%         csi_entry{1}.csi=csi;
        
        
        Pmusic1=my_spotfi(csi_entry,1);
        Pmusic2=my_spotfi(csi_entry,2);
        
        

        maxmin1=max(Pmusic1{1})-min(Pmusic1{1});
        [m1,flag1]=max(maxmin1);
        [pks1,locs1] = findpeaks(Pmusic1{1}(:,flag1));
        pks_flag1(locs1)=pks_flag1(locs1)+1;
        
        maxmin2=max(Pmusic2{1})-min(Pmusic2{1});
        [m2,flag2]=max(maxmin2);
        [pks2,locs2] = findpeaks(Pmusic2{1}(:,flag2));
        pks_flag2(locs2)=pks_flag2(locs2)+1;
        
        
        figure(1);
        subplot(2,2,1);
        plot(Pmusic1{1});
        title(['number:  ',num2str(ii)]);
        axis tight;
        subplot(2,2,2);
        plot(Pmusic2{1});
        axis tight;
        subplot(2,2,3);
        plot(pks_flag1);
        subplot(2,2,4);
        plot(pks_flag2);
        
        drawnow;
        ii = ii+1;
    end
end
    
    
    
