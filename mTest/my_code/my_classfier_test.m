function ret = my_classfier_test()
%MY_KNN Summary of this function goes here
%   Detailed explanation goes here
load csi_sum;
testnum = randi([1,150],1,10);

csi_label = zeros(3,10);
csi_label(1,:) = testnum;

for i = 1:10
    csi_test = csi_sum(1:5,((testnum(i)-1)*100+1):testnum(i)*100);
    csi_label(3,i ) = my_classfier(csi_test,csi_sum);
    
end 
ret = csi_label;

end

