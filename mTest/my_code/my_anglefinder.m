function [angleflag1,angleflag2] = my_anglefinder...
    (ampflag1,ampflag2,pks_cell1,pks_cell2)
%MY_ANGLEFINDER Summary of this function goes here
%利用my_pksfinder.m输出的ampflag（每一个Pmusic中提取出
%的最大差值的信号的差值，作为权值），以及每一个pks_cell
%中的角度信息来加权，得到最重要的多径角度信息。
%   Detailed explanation goes here
%
N=length(pks_cell1);
angleflag1=zeros(181,1);
angleflag2=zeros(181,1);

for ii = 1:1:N
    if isempty(pks_cell1(ii))
        continue;
    else
        angle=pks_cell1{ii};
        angleflag1(angle)=ampflag1(ii)+angleflag1(angle);
    end 
    
    if isempty(pks_cell2(ii))
        continue;
    else
        angle=pks_cell2{ii};
        angleflag2(angle)=ampflag2(ii)+angleflag2(angle);
    end  
    
end

