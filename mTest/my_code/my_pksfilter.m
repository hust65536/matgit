function [ norm_pks, norm_ret_pks,norm_real_pks] = my_plotpks( Pmusic )
%MY_ Summary of this function goes here
%   Detailed explanation goes here
[theta,los,los,pks,pks,ampflag,ampflag,pks_cell,pks_cell] = ...
    my_pksfinder( Pmusic,Pmusic );

ret_cell=cell(length(Pmusic),1);
    for ii=1:1:length(Pmusic)
        if  ~isempty(pks_cell{ii}) & min(abs(los-pks_cell{ii}))==0
            ret_cell(ii)=Pmusic(ii);
        else 
            ret_cell{ii}=[];
        end      
    end
ret_cell(cellfun(@isempty,ret_cell))=[];

[theta,ret_locs,ret_locs,ret_pks,ret_pks,ret_ampflag,ret_ampflag,ret_pks_cell,ret_pks_cell] = ...
    my_pksfinder( ret_cell,ret_cell );

norm_pks=mapminmax(pks',0,1);
norm_ret_pks=mapminmax(ret_pks',0,1);
norm_real_pks=mapminmax(norm_pks.*norm_ret_pks,0,1);
norm_real_pks=norm_real_pks';
norm_real_pks=norm_real_pks;
norm_pks=norm_pks;
norm_ret_pks=norm_ret_pks;


end

