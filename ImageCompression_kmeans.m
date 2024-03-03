
% Image compression using K-means clustering

% Read the original image
I = imread('peppers.png');
% Display the original image
figure;
imshow(I);

% Set the number of clusters for K-means
N = 10; % You can change this value to adjust the level of compression

% Reshape the image into a 2D array where each row is a pixel and each column represents the RGB channels
Ireshape = reshape(I, [size(I, 1) * size(I, 2), 3]);

% Convert the image array to double for K-means computation
dIr = double(Ireshape);

% Apply K-means clustering to the image data
% idx contains the cluster indices for each pixel
% C contains the cluster centroid values (the average color of each cluster)
[idx, C] = kmeans(dIr, N);

% Initialize the compressed image array
dIra = zeros(size(dIr));

% Assign each pixel in the compressed image the color of its corresponding cluster centroid
for i = 1:length(dIr)
    dIra(i, :) = C(idx(i), :);
end

% Reshape the compressed image array back to the original image dimensions
rdIra = reshape(dIra, [size(I, 1), size(I, 2), 3]);

% Convert the compressed image array back to uint8 format for display
CI = uint8(rdIra);

% Display the compressed image
figure;
imshow(CI);
