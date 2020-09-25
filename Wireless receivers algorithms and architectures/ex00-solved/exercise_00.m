% Start time measurement
tic();
L = 1000000;
% Source: Generate random bits
txbits = randi([0 1],L,1);
% all 'A' but as int8 type
temp = ones(L,1) .* double('A');
% Mapping: Bits to symbols
tx = char(txbits + temp);
%random vecotor for 0.2 probability
r = double(rand(L,1) < 0.2);
% Channel: Apply BSC
rx = tx + r.* ( double(tx =='A') - double(tx =='B') );
% Demapping: Symbols to bits
rxbits = rx - char(temp);
% BER: Count errors
errors = sum(double(txbits ~= rxbits));
% Output result
disp(['BER: ' num2str(errors/L*100) '%'])
% Stop time measurement
toc()