function plot_BER(minimize_hamming_distance)
    % signal = vector of phases(because this is adding noise to the
    % BPSK-2bit constalation phase)
    % Desired SNR in dB is given to calculate the level of desired noise 
    % in this simulation
    % returns signal with desired SNR, where the noise is AWGN
    
    str = '';
    video_name = '';
    if(minimize_hamming_distance)
        str = 'With Hamming mapping';
        video_name = 'BPSK_complex_grid_for_different_SNRs_with_Hamming';
    else
        str = 'Without Hamming mapping';
        video_name = 'BPSK_complex_grid_for_different_SNRs_without_Hamming';
    end
    SNR_MIN_DB = -20; %SLOW SIMULATION
    SNR_MAX_DB = 60; %SLOW SIMULATION
    %SNR_MIN_DB = 5; %FAST SIMULATION
    %SNR_MAX_DB = 20; %FAST SIMULATION
    STEP_SIZE_SNR_DB = 2; %1
    errors = [];
    snrs = [];
    i=1;
    axis tight manual
    v=VideoWriter(strcat(video_name,'.avi'));
    v.FrameRate = 2;
    open(v);
    
    for snr_db = SNR_MIN_DB:STEP_SIZE_SNR_DB:SNR_MAX_DB
        % generate random image with 200x200 pixels
        ri = uint8(255*rand(200));
        % bit vector of a random image
        bv = my_image_encoder(ri);
        % phase vector of BPSK mapper from the inputed bit vector bv
        pv = my_BPSK_mapper(bv,minimize_hamming_distance);
        % phase vector with AWGN
        pv_awgn = analog_AWGN(pv, snr_db);
        % bit vector of a random image with awgn
        bv_awgn = my_BPSK_demapper(pv_awgn,minimize_hamming_distance);
        % bit error rate - BER
        errors(i) = sum(abs(bv - bv_awgn))/length(bv);
        snrs(i) = snr_db;
        i = i + 1;
        plot_BPSK(pv, pv_awgn,snr_db,minimize_hamming_distance);
        frame = getframe(gcf);
        writeVideo(v,frame);
    end
    figure()
    semilogy(snrs,errors)
    grid on
    grid minor
    title(['BER for SNR [dB] in range: [',num2str(SNR_MIN_DB),', ',num2str(SNR_MAX_DB),']; with step size = ',num2str(STEP_SIZE_SNR_DB),' dB']);
    xlabel({['SNR[dB]; ',str];'Author : milos.novakovic@epfl.ch'})
    ylabel('BER')
    % save last figure that captures the realtionship between SNRs and BERs
    saveas(gcf,strcat(video_name,'.png'));
    %save snrs(SNRs) and errors (BERs)
    save(strcat(video_name,'.mat'),'snrs','errors');
    frame = getframe(gcf);
    writeVideo(v,frame);
    close(v);
    return
end
