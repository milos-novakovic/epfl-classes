function [bit_vector] = my_BPSK_demapper(phase_vector,minimize_hamming_distance)
% my_BPSK_demapper - demaps a vector of phases named phase_vector and returns
% vector of bits which has length twice as bigger than phase
% vecotor, because it demaps two bits from the complex plane, with respect to
% the BPSK constalation
% Author(s): Milos Novakovic
% Copyright (c) 2020 EPFL.
% Convert the vector (stream) of phasesito the bit vecotr
% of ones and zeros (bits)
% (coordinates in complex plane restricted
% to the complex circle of the radius equal to one - The Unit circle)

% number_of_BPSK_bits is 2!!!
dimensions = size(phase_vector);
length = dimensions(1);
%allocate space
BPSK_constelation = ones(2);
bit_vector = uint8(ones(length*2,1));
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
    symbol = find(sign(real(BPSK_constelation)) == sign(real(phase_vector(i))) & sign(imag(BPSK_constelation)) == sign(imag(phase_vector(i)))) - 1;
    bit_vector(2*i-1) = mod(symbol,2);
    bit_vector(2*i) = floor(symbol/2);
end
return
