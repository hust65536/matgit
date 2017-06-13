function [ret_pks1,ret_pks2]=my_profiling(...
                locs1,locs2,pks_cell1,pks_cell2,pks1,pks2,Pmusic1,Pmusic2)
%利用MY_crossfinder函数找到的主路径的度数locs1  locs2，
%然后选择出多径角度中包含locs1 和locs2 的Pmusic 的cell
%然后再利用选择出的cell进行绘制
%   Detailed explanation goes here
    N=length(pks_cell1);
    pks_cell_flag1=zeros(N,1);
    pks_cell_flag2=zeros(N,1);
    ret_cell1=cell(N,1);
    ret_cell2=cell(N,1);
    for ii=1:1:N
         if  ~isempty(pks_cell1{ii}) & min(abs(locs1-pks_cell1{ii}))==0
            ret_cell1(ii)=Pmusic1(ii);
        else 
            ret_cell1{ii}=[];
        end   
            
        if  ~isempty(pks_cell2{ii}) & min(abs(locs2-pks_cell2{ii}))==0
            ret_cell2(ii)=Pmusic2(ii);
        else 
            ret_cell2{ii}=[];
        end  
    end
ret_cell1(cellfun(@isempty,ret_cell1))=[];
ret_cell2(cellfun(@isempty,ret_cell2))=[];
%     ret_cell1=cell(sum(pks_cell_flag1),1);
%     ret_cell2=cell(sum(pks_cell_flag2),1);
[theta,ret_locs1,ret_locs2,ret_pks1,ret_pks2,ret_ampflag1,ret_ampflag2,ret_pks_cell1,ret_pks_cell2] = ...
    my_pksfinder( ret_cell1,ret_cell2 );

% norm_pks1=mapminmax(pks1',0,1);
% norm_ret_pks1=mapminmax(ret_pks1',0,1);
% norm_real_pks1=mapminmax(norm_pks1.*norm_ret_pks1,0,1);
% norm_pks2=mapminmax(pks2',0,1);
% norm_ret_pks2=mapminmax(ret_pks2',0,1);
% norm_real_pks2=mapminmax(norm_pks2.*norm_ret_pks2,0,1);
%     
    
end
