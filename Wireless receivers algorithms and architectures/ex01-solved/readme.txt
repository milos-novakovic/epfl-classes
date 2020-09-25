1. run_all.m = runns all scripts required for the problem and plots
the difference of coding 2 bit BPSK with Hamming distance equal to one
and the Hamming distance equal to two(something like main in C/C++)
(uses plot_BER.m)

2. plot_BER.m = plots a lot of 2 bit BPSK complex planes for different SNRs,
makes a little movie video for easier viewing of AWGN distorsion on the random
generated image, also plots BER (bit error rate) as a function of SNRs in dB

3.plot_BPSK.m = plots exactly one complex plane with 2 bit BPSK for a given SNRs
(plot_BER uses this script)

4.my_BPSK_mapper.m = maps a vector of bits and returns
 vector of phases which has length that is equal of the half of the bit
 vecotor, because it maps two bits on to complex plane, with respect to
 the 2 bit BPSK constalation 
 
5. my_BPSK_demapper.m = demaps a vector of phases and returns
 vector of bits which has length twice as bigger than phase
 vecotor, because it demaps two bits from the complex plane, with respect to
 the 2 bit BPSK constalation
 
6. analog_AWGN.m = adds AWGN of desired SNR in dB to the analog signal;
adds noise to the signal that came out of the mapper, so that
signal (with AWGN added to it) goes as an input to the demapper

7.exercise_01.m = shows what happends to the real world image when SNR
is to low

8.my_image_encoder.m = encodes an given image into a bit stream (bit_vector) and 
returns it that bit stream

9.image_decoder.m = decodes a bit stream into an image with
 a given fixed size and display it