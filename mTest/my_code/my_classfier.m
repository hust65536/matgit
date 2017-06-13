function ret = my_classfier(csi_test,csi_sum)
%MY_DTW Summary of this function goes here
%   Detailed explanation goes here
%csi_sum is the input training data set 
% load csi_filtered;
N = length(csi_sum);
csi_train = [];
csi_label = zeros(1,N);
dtw_mat = [];
K = 10;%top k means

csi_train = csi_sum(1:5 , :);
csi_label = csi_sum(6 , : );
for i = 1:1:(N/100)
    csi_testwith = csi_train(:,((i-1)*100+1):i*100);
    for j = 1:1:5
        r=csi_testwith(j,:);
        t = csi_test(j,:);
        r = r/max(r);
        t = t/max(t);
        [Dist,D,k,w]=dtw(t,r);
        dtw_mat(j,i) = Dist;
    end  
end

dtw_mat = dtw_mat.^2;
dtw_dist = sum(dtw_mat);
[dists, neighbors] = sort(dtw_dist); 

class_count = zeros(1,3);  
for i=1:K  
    if    neighbors(i)<=50
        class_count(1,1) = class_count(1,1)+1;
    elseif neighbors(i)>50 & neighbors(i)<=100
        class_count(1,2) = class_count(1,2)+1;
    else
        class_count(1,3) = class_count(1,3)+1;
    end
end  
 [maxr,index]=max(class_count);

ret = index;


end

