function Pmusic_packet_data=my_spotfi(csi_data,Txnumm)
    %% DEBUG AND OUTPUT VARIABLES-----------------------------------------------------------------%%
    % Debug Controls
    
    global NUMBER_OF_PACKETS_TO_CONSIDER

    
    % Output controls
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Set physical layer parameters (frequency, subfrequency spacing, and antenna spacing
    antenna_distance = 0.06;
    % frequency = 5 * 10^9;
    frequency = 2.445 * 10^9;
    % frequency = 5.32 * 10^9;
    sub_freq_delta = (20 * 10^6) / 30;
     Txnum=Txnumm;
    % Loop over passed in data files
%     for data_file_index = 1:length(data_files)
        % Read data file in
%         fprintf('\n\nRunning on data file: %s\n', data_file)
%         csi_trace = read_bf_file(data_file);
        csi_trace = csi_data;%ֱ�Ӷ�ȡ�ļ�������
        ss=inputname(1);
        % Extract CSI information for each packet
%         fprintf('Have CSI for %d packets\n', length(csi_trace))
        
        % Set the number of packets to consider, by default consider all
        num_packets = length(csi_trace);
        if NUMBER_OF_PACKETS_TO_CONSIDER ~= -1
            num_packets = NUMBER_OF_PACKETS_TO_CONSIDER;
        end
%         fprintf('Considering CSI for %d packets\n', num_packets)
%         sampled_csi_trace = csi_sampling(csi_trace, num_packets);
        Pmusic_packet_data = spotfi(csi_trace, frequency, sub_freq_delta, antenna_distance, ...
                ss,Txnum);
            
% %     end
        
        ret = Pmusic_packet_data;
end

