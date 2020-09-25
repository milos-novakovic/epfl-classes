function [bit_vector, bit_matrix, pixel_vector] = my_image_encoder(image)
% MY_IMAGE_ENCODER - Encodes an image into a bit stream (bit_vector) and 
% returns it
%   function [bit_vector] = my_image_encoder(image)
%    
%    Arguments:
%      image:      (matrix) gray scaled image in matrix form
%      bit_vector: (vector) from LSB to MSB, and from (1,1) element in image
%       matrix, and the pixels are transmitted rowwise
% 
% Author(s): Milos Novakovic
% Copyright (c) 2020 EPFL.
% Convert the image (image) into a bit stream (bit_vector)

%height, width, depth
[h,w,d] = size(image);
if (d ~= 1)
   error('Image must be gray-scaled!') 
end
pixel_vector = reshape(image.',h*w,1);
bit_matrix = de2bi(pixel_vector);
bit_vector = reshape(bit_matrix.',h*w*8,1);
return
