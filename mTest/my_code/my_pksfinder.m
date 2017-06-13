
function [theta,los1,los2,pks1,pks2,ampflag1,ampflag2,pks_cell1,pks_cell2] = ...
    my_pksfinder( Pmusic1,Pmusic2 )
%MY_PKSFINDER输出天线1和天线2所接受到的Pmusic cell中的累加和，然后
%利用dtw循环匹配，找到天线1和天线2之间的角度差值
% function [pks_flag,pks_Pmusic] = my_pksfinder( Pmusic )
%  输出ampflag，每一个Pmusic中提取出的最大差值的信号的
%差值，作为权值。
    N = length(Pmusic1);
    pks1=zeros(181,1);
    pks2=zeros(181,1);
    Dist_flag=zeros(181,1);
    pks_cell1=cell(N,1);
    pks_cell2=cell(N,1);
    
    ampflag1=zeros(N,1);
    ampflag2=zeros(N,1);

    temp_pks=zeros(181,1);
    for ii = 1:1:N
        Phase1 = Pmusic1{ii};
        maxmin1=max(Phase1)-min(Phase1);
        [m1,flag1]=max(maxmin1);
        ampflag1(ii)=abs(m1);
        
%             pks1=mapminmax(pks1');
%             pks1=pks1';
%             pks1 = pks1+m1*squeeze(Phase1(:,flag1)); 
            pks1 = pks1+squeeze(Phase1(:,flag1)); 
            [pks,loc1]=findpeaks(squeeze(Phase1(:,flag1)));
           pks_cell1{ii}=loc1;

       
        
        Phase2 = Pmusic2{ii};
        maxmin2=max(Phase2)-min(Phase2);
        [m2,flag2]=max(maxmin2);
        ampflag2(ii)=abs(m2);
        
%             pks2=mapminmax(pks2');
%             pks2=pks2';
%             pks2 = pks2+m2*squeeze(Phase2(:,flag2)); 
            pks2 = pks2+squeeze(Phase2(:,flag2)); 
            [pks,loc2]=findpeaks(squeeze(Phase2(:,flag2)));
             pks_cell2{ii}=loc2;

    end
   


    for ii = 1:1:181
        temp_pks=[pks1(ii+1:181);pks1(1:ii)];
        [Dist,D,k,w]=dtw(temp_pks',pks2') ;
        Dist_flag(ii)=Dist;
    end
    
    [pks,locs1]=findpeaks(pks1);
    [pks,locs2]=findpeaks(pks2);
    [m,theta]=min(Dist_flag); 
    M=size(locs1,1);
    N=size(locs2,1);
    if  theta>91
        temp1=repmat(locs1,1,N);
        temp2=repmat(locs2',M,1);
        temp=abs(temp2-temp1-181+theta);
        [x,y]=find(temp==min(min(temp)));
        los1=locs1(x);
        los2=locs2(y);
        
    else
        temp1=repmat(locs1,1,N);
        temp2=repmat(locs2',M,1);
        temp=abs(temp1-temp2-theta);
        [x,y]=find(temp==min(min(temp)));
        los1=locs1(x);
        los2=locs2(y);
        
    end
    

    %归一化
%     pks1=mapminmax(pks1');
%     pks2=mapminmax(pks2');
%     pks1=pks1';
%     pks2=pks2';
    
end






