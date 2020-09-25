function plot_BPSK(signal, signal_with_noise,snr_db,minimize_hamming_distance)
    % signal = vector of phases(because this is adding noise to the
    % BPSK-2bit constalation phase)
    % Desired SNR in dB is given to calculate the level of desired noise 
    % in this simulation
    % returns signal with desired SNR, where the noise is AWGN
    str = '';
    if(minimize_hamming_distance)
        str = 'With Hamming mapping';
    else
        str = 'Without Hamming mapping';
    end
    figure()
    s_r = real(signal); % real part of the complex input signal
    s_i = imag(signal); % imaginary part of the complex input signal
    sn_r = real(signal_with_noise); % real part of the complex input signal with noise
    sn_i = imag(signal_with_noise); % imaginary part of the complex input signal with noise
    without_noise = plot(s_r,s_i,'r*','MarkerSize',15)
    hold on
    with_noise = plot(sn_r,sn_i,'bo')
    uistack(without_noise,'top') 
    grid on
    grid minor
    title(['Effect of AWGN (with SNR = ', num2str(snr_db),' dB) on the coordinates of a 2-bit BPSK'])
    xlabel({['Re; ',str];'Author : milos.novakovic@epfl.ch'})
    ylabel('Im')
    %make a Unit circle to better visualise the results
    r = 1; % radius of the unit circle
    xc = 0; % center coordinate x of the unit circle
    yc = 0;% center coordinate y of the unit circle
    theta = linspace(0,2*pi);
    x = r*cos(theta) + xc;
    y = r*sin(theta) + yc;
    plot(x,y,'k')
    plot(zeros(length(x),1),linspace(-1,1,length(x)),'k','LineWidth',1)
    hold on
    plot(linspace(-1,1,length(x)),zeros(length(x),1),'k','LineWidth',1)
    axis equal
    legend('With noise','Without noise','Unit circle')
    return
end
