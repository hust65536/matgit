function ret =  my_bandfilter(raw_csi)


N = length(raw_csi)

y = abs(raw_csi);

%hampel 滤波器


Fs = 100;%低通滤波
Wc=2*5/Fs;                                    
[b,a]=butter(4,Wc);
yFilter=filter(b,a,y);

yTemp = 0;
yMed = [];

yMed(1:30) = yFilter(1:30);
%均值降噪
for i = 31:1:N
    for m = 1:1:30
        yTemp = yTemp + m*yFilter(i-31+m);
    end
    yMed(i) = yTemp/465;
    yTemp = 0;
end



% ySub =0;%这里是为了计算减去均值后的csi信息
% for i = 501:1:2500
%     ySub = ySub + yMed(i);%houmian yao ba 2500 huan cheng N
% end
%  yMean = ySub/2000;
%  vMean = zeros(1,5000);
%  vMean(1,501:2500) = yMean;
%  
%  ySub =0;
% for i = 2501:1:4500
%     ySub = ySub + yMed(i);
% end
%  yMean = ySub/2000;
%  vMean(1,2501:4500) = yMean;
%  
%  y = yMed-vMean;
%  y(1:500)=0;
%  y(2501:2530)=0;
%  y(4501:5000)=0;
 
%  figure(2);
%  plot(y);

 
ret = yMed;

    


end

