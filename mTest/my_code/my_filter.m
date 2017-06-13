function ret = my_filter( raw_csi )
%MY_COMPLEXFILTER Summary of this function goes here
%   Detailed explanation goes here
%复数滤波器
N = length(raw_csi);
yFilter=zeros(N,1);
Fs = 10;%低通滤波
Wc=2*5/Fs;                                    
[b,a]=butter(4,Wc);
yFilter=filter(b,a,raw_csi);
ret=yFilter;

end

