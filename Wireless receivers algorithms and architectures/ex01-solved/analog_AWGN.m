function [signal_AWGN] = analog_AWGN(signal, SNR_dB)
    % signal = vector of phases(because this is adding noise to the
    % BPSK-2bit constalation phase)
    % Desired SNR in dB is given to calculate the level of desired noise 
    % in this simulation
    % returns signal with desired SNR, where the noise is AWGN
    
    % standard deviation sigma for desired SNR in dB (mean is 0 in AWGN model)
    sigma = sqrt(10^(-SNR_dB/10));
    % add standard normal AWGN with sigma as a parameter
    % to each discrete-time sample of the (phase) signal
    signal_AWGN = signal + sigma/sqrt(2) * randn(numel(signal),1) + 1j*(sigma/sqrt(2) * randn(numel(signal),1));
    return
end