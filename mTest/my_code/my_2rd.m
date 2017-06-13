function ret = my_2rd( raw_csi)
%MY_2RD Summary of this function goes here
%   Detailed explanation goes here
N= length(raw_csi);
csi_2rd = zeros(30,N);
for num = 1:1:30
    for i = 4:1:(N-3)
        csi_2rd(num,i) = (4*raw_csi(num,i)+raw_csi(num,i+1)+raw_csi(num,i-1)-2*raw_csi(num,i+2)-2*raw_csi(num,i-2)-raw_csi(num,i+3)-raw_csi(num,i-3))/16;
    end
end

ret = csi_2rd;    

end

