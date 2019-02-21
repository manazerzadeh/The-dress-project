function [ centroids, weights ] = img2CentsWeights( imgstr )
A = imread(imgstr);
figure;
% A = projectImageonPlane('dress.jpg',[-0.8037,1.6876,-1,15.9798]);
T = A;
r = A(:,:,1);
g = A(:,:,2);
b = A(:,:,3);
r = r(:);
g = g(:);
b = b(:);
X = [r,g,b];
c0 = uint8(0:25:255);
len = numel(c0);
inits = ones(len*len*len-1,3);
for i = 1:(len-1)
    for j = 1:(len-1)
        for k = 1:(len-1)
            inits(i+j*len+k*len*len, :) = [c0(i),c0(j),c0(k)];
        end
    end
end
centroids = [];
[centroids1,idx] = runkMeans(double(X), double(inits), 5);
a = ~isnan(centroids1);
a = a(:,1);
centroids = centroids1(a,:);
hold off;
% plotreg(centroids,0,255);
S = zeros(size(centroids1,1),1);
for i = 1:size(centroids1,1)
    S(i) = ((numel(idx(idx == i)))/numel(idx(:,1)));
end
S = S(a);
weights = S;
end

