function bitwiseXOrBinary = bitwiseXORBinary
 tic
 rgb_image_1 = imread('image.jpg');
 subplot(1, 2, 1);
 imshow(rgb_image_1);
 axis on;
 title('Original Image', 'FontSize', 24);
 new_image = bitxor(rgb_image_1(1:end-1, :, :), rgb_image_1(2:end, :, :));
 recon_image = bitxor(rgb_image_1(:, 1:end-1, :), rgb_image_1(:, 2:end, :));
 % Add on original left column (tack column 1 onto the left side):
 recon_image_2 = rgb_image_1; % Initialize
 recon_image_2(:, 2:end, :) = recon_image;
 subplot(1, 2, 2);
 imshow(recon_image_2);
 axis on;
 title('BitXOR Image', 'FontSize', 30);
 toc
end