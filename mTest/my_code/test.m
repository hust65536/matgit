%平时运行的脚本都放在这里


%按照信号的maxmin权值加权角度信息
N=length(ampflag4);
angle_temp4=zeros(181,1);

for ii = 1:1:N
    if isempty(pks_cell4(ii))
        continue;
    else
        angle=pks_cell4{ii};
        angle_temp4(angle)=ampflag4(ii)+angle_temp4(angle);
    end  
end
clear N angle ii


[theta,locs1,locs1,pks1,pks1,ampflag1,ampflag1,ret_pks_cell,ret_pks_cell] = ...
    my_pksfinder( Pmusic,Pmusic )

[theta,locs2,locs2,pks2,pks2,ampflag2,ampflag2,pks_cell2,pks_cell2] = ...
    my_pksfinder( chest1,chest1 )

N=length(Pleg4a1);
pks_cell4=cell(N,1);
for ii =1:1:N
    Pmusic=Pleg4a1{ii};
    maxmin1=max(Pmusic)-min(Pmusic);
    [m1,flag1]=max(maxmin1);
    [m,locs]=findpeaks(Pmusic(:,flag1));
    pks_cell4{ii}=locs;
end
clear N ii m1 flag1 maxmin1 locs m Pmusic




%my_profiling script

Pmusic=Pchest4;
pks_cell=pks_cell4;
locs=los4;
ret_cell=cell(length(Pmusic),1);
    for ii=1:1:length(Pmusic)
        if  ~isempty(pks_cell{ii}) & min(abs(locs-pks_cell{ii}))==0
            ret_cell(ii)=Pmusic(ii);
        else 
            ret_cell{ii}=[];
        end      
    end
    ret_cell(cellfun(@isempty,ret_cell))=[];
    ret_cell4=ret_cell;
    clear ret_cell Pmusic pks_cell locs

    
[theta,ret_locs,ret_locs,ret_pks,ret_pks,ret_ampflag,ret_ampflag,ret_pks_cell,ret_pks_cell] = ...
    my_pksfinder( ret_cell,ret_cell );
clear ret_locs ret_ampflag ret_pks_cell theta


pks=pks4;
ret_pks=ret_pks4;
norm_pks=mapminmax(pks',0,1);
norm_ret_pks=mapminmax(ret_pks',0,1);
norm_real_pks=mapminmax(norm_pks.*norm_ret_pks,0,1);
norm_real_pks=norm_real_pks';
norm_real_pks4=norm_real_pks;
norm_pks4=norm_pks;
norm_ret_pks4=norm_ret_pks;
clear norm_real_pks  pks ret_pks norm_pks norm_ret_pks

plot(norm_real_pks)

aaaLeg0=zeros(181,1);
leg=[aaaLeg1,aaaLeg2,aaaLeg3,aaaLeg4,aaaLeg0]
surf(leg)
colormap(jet);
view(-90,90)

figure(1)
hold on
plot(norm_pks1)
plot(norm_ret_pks1)
plot(norm_real_pks1)


[ret_pks1,ret_pks2]=my_profiling(...
    locs1,locs1,pks_cell1,pks_cell1,pks1,pks1,Pmusic,Pmusic)



