function run_all()
% calculation and result acquisition
plot_BER(true);
close all;
plot_BER(false);
close all;
%loading BER in the function of SNR for two types of 2bit BPSK coding
load BPSK_complex_grid_for_different_SNRs_with_Hamming.mat snrs errors
snrs_hamming = snrs;
errors_hamming = errors;
load BPSK_complex_grid_for_different_SNRs_without_Hamming.mat snrs errors
snrs_no_hamming = snrs;
errors_no_hamming = errors;
%plotting
figure()
semilogy(snrs_hamming,errors_hamming)
hold on
semilogy(snrs_no_hamming,errors_no_hamming)
grid on
grid minor
legend('with Hamming distance = 1 (Gray code)','with Hamming distance = 2')
title('BER (bit error rate) for SNR [dB]');
xlabel({'SNR[dB]; ';'Author : milos.novakovic@epfl.ch'})
ylabel('0 < BER < 1')
% save last figure that captures the realtionship between SNRs and BERs
% for both coding styles
saveas(gcf,strcat('together_BER_SNR','.png'));
end