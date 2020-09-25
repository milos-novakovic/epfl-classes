function [phase_vector] = my_BPSK_mapper(bit_vector,minimize_hamming_distance)
% my_BPSK_mapper - maps a vector of bits named bit_vector and returns
% vector of phases which has length that is equal of the half of the bit
% vecotor, because it maps two bits on to complex plane, with respect to
% the BPSK constalation
% 
% Author(s): Milos Novakovic
% Copyright (c) 2020 EPFL.
% Convert the vector of ones and zeros (bits)
% into a stream of phases (coordinates in complex plane restricted
% to the complex circle of the radius equal to one - The Unit circle)


% number_of_BPSK_bits is 2!!!
dimensions = size(bit_vector);
length = dimensions(1);
%allocate space
BPSK_constelation = ones(2);
phase_vector = ones(length/2,1);
if (minimize_hamming_distance)
    % BPSK mapper Mapping from Figure 1.4, on the next link
    % https://moodle.epfl.ch/pluginfile.php/1580172/mod_resource/content/2/01_MappingDemapping.pdf
    BPSK_constelation = [-1-1j 1-1j; -1+1j 1+1j] /sqrt(2);
else
    % BPSK mapper Mapping from Figure 1.6, on the next link
    % https://moodle.epfl.ch/pluginfile.php/1580172/mod_resource/content/2/01_MappingDemapping.pdf
    BPSK_constelation = [1-1j -1+1j; 1+1j -1-1j] /sqrt(2);
end
for i = 1:(length/2)
    phase_vector(i) = BPSK_constelation(bit_vector(2*i)*2 + bit_vector(2*i-1)*1 + 1);
end
return
