
function [locs1, pks1, selected_cell1, Pmusic_ant1] = gogogo( filename)

filename = strcat('surface/',filename);
%Step1
csitrace=read_bf_file(filename);
%Step2
% csitrace=my_clearstruct(csitrace);
%Step3
Pmusic_ant1=my_spotfi(csitrace,1);
% csi_ant2=my_spotfi(csitrace,2);
%Step4
[theta,locs1,locs2,pks1,pks2,selected_cell1,selected_cell2] = ...
    my_pksfinder(Pmusic_ant1,Pmusic_ant1);
%Step5
% [ret_cell1,ret_cell2]=...
%     my_profiling(locs1,locs2,selected_cell1,selected_cell2);
%Step6 这里的 alpha1 alpha2 到底用哪个角度还没有确定
% [ length1,length2,beta1,beta2,theta1,theta2 ] = ...
%     my_crossfinder( alpha1,alpha2,h );


end
