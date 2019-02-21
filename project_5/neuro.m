A = imread('multi2.jpg');
T = A;
r = A(:,:,1);
g = A(:,:,2);
b = A(:,:,3);
r = r(:);
g = g(:);
b = b(:);
X = double([r,g,b]);
gmodel = fitgmdist(X,2);
mus = double(gmodel.mu);
fileName = 'p (9)';
generated = generate_online('dress.jpg', strcat(fileName,'.jpg'));

X = double(reshape(generated(:),numel(generated)/3,3));
filteredX = filterMulti(X, mus, 0.5);
filteredX = uint8((reshape(filteredX(:),size(generated))));
allHsvTest(filteredX,fileName);
% 
% X = double(ta);
% X = reshape(X(:),numel(ta)/3,3);
% newX = filterMulti( X, mus, 0.3);
% newTa = uint8(reshape(newX(:),size(ta)));
% figure;
% image(newTa);
% figure
% [centroids, weights] = rgb2CentsWeights(ta);
% drawWeightsColors(centroids, weights, 2000);
