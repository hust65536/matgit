function [ retF , retPxx] =  my_psd( raw_csi )
%MY_D Summary of this function goes here
%   Detailed explanation goes here
Fs=100;
L=length(raw_csi);
nfft = 2^nextpow2(L); 
window=boxcar(L);
[Pxx,f]=periodogram(raw_csi,window,nfft,Fs);
% Pxx=smooth(Pxx,'loess');

bar(f,Pxx);
xlabel('频率/Hz');
retF = f;
retPxx = Pxx;


 



end

