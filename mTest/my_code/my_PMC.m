function ret = my_PMC( Pmusic )
%MY_PHASEDETECTION 此处显示有关此函数的摘要
%   此处显示详细说明Phase music information clearer
%把spotfi得到的Pmusic数据包进行化简，得到最明显的多径信息。
    N = length(Pmusic);
    Pm_max = cell(N,1);
    for ii = 1:1:N
        Phase = Pmusic{ii};
        maxmin=max(Phase)-min(Phase);
        [m,flag]=max(maxmin);
        Pm_max{ii}=Phase(:,flag);
            

    end
    ret = Pm_max;
end

