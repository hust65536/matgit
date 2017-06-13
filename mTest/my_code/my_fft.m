function ret = my_fft( raw_csi )
%MY_FFT Summary of this function goes here
%   Detailed explanation goes here
Fs = 100;                    % 采样频率

T = 1/Fs;                     % 采样时间

L = length(raw_csi);                     % 信号长度

t = (0:L-1)*T;                % 时间向量


Y = raw_csi;     % 加噪声正弦信号

% plot(Fs*t(1:50),y(1:50))
% 
% title('零平均值噪音信号');
% 
% xlabel('time ')

NFFT = 2^nextpow2(L); % Next power of 2 from length of y

Y = fft(Y,NFFT)/L;

Y = smooth(Y);
f = Fs/2*linspace(0,1,NFFT/2);

plot(f,2*abs(Y(1:NFFT/2)));

title('y(t)单边振幅频谱');

xlabel('Frequency (Hz)');

ylabel('|Y(f)|');

ret = Y;
end

