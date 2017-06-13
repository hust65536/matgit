function run_spotfi(data_file)
    %% DEBUG AND OUTPUT VARIABLES-----------------------------------------------------------------%%
    % Debug Controls
    global NUMBER_OF_PACKETS_TO_CONSIDER
    
    % Output controls
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Set physical layer parameters (frequency, subfrequency spacing, and antenna spacing
    antenna_distance = 0.1;
    % frequency = 5 * 10^9;
    frequency = 5.785 * 10^9;
    % frequency = 5.32 * 10^9;
    sub_freq_delta = (40 * 10^6) / 30;
    
    % Loop over passed in data files
%     for data_file_index = 1:length(data_files)
        % Read data file in
        fprintf('\n\nRunning on data file: %s\n', data_file)
        csi_trace = read_bf_file(data_file);
        
        % Extract CSI information for each packet
        fprintf('Have CSI for %d packets\n', length(csi_trace))
        
        % Set the number of packets to consider, by default consider all
        num_packets = length(csi_trace);
        if NUMBER_OF_PACKETS_TO_CONSIDER ~= -1
            num_packets = NUMBER_OF_PACKETS_TO_CONSIDER;
        end
        fprintf('Considering CSI for %d packets\n', num_packets)
        sampled_csi_trace = csi_sampling(csi_trace, num_packets);
        output_top_aoas = spotfi(sampled_csi_trace, frequency, sub_freq_delta, antenna_distance, ...
                data_file)
%     end
end

