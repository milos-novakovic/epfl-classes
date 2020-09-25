%I1 = imread('ngc6543a.jpg');
I = imread('papers.png');

figure(),imshow(I);

I_gs = rgb2gray(I);
figure(), imshow(I_gs);

%snr_db = -40;

[A1,A2,A3] = my_image_encoder(I_gs);
for snr_db = -50:5:0
    B1 = pixel_AWGN(A3,snr_db);
    %figure()
    image_decoder(B1,size(I_gs))
end