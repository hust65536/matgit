function ret = my_SVM()
%MY_SVM Summary of this function goes here
%   Detailed explanation goes here
load csi.txt;
csi_inst = csi(:,1:4);
csi_label = csi(:,5);

model = svmtrain(csi_label, csi_inst, '-c 1 -g 0.07');
[predict_label, accuracy, dec_values] = svmpredict(csi_label, csi_inst, model);
%[predict_label, accuracy, dec_values] = svmpredict(csi_label, csi_inst, model);

ret = accuracy;

end


