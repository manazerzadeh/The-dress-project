function ta = generate_online( addr1_dress, addr2_newPic )
% [centroids, weights] = img2CentsWeights('dress.jpg');
% drawWeightsColors(centroids, weights, 2000);
A = imread(addr1_dress);
figure;
T = A;
r = A(:,:,1);
g = A(:,:,2);
b = A(:,:,3);
r = r(:);
g = g(:);
b = b(:);
X = double([r,g,b]);
gmodel = fitgmdist(X,4);
idx = cluster(gmodel,X);
cluster1 = X(idx == 1,:);
cluster2 = X(idx == 2,:);
cluster3 = X(idx == 3,:);
cluster4 = X(idx == 4,:);
gm1 = fitgmdist(cluster1,1);
gm2 = fitgmdist(cluster2,1);
gm3 = fitgmdist(cluster3,1);
gm4 = fitgmdist(cluster4,1);
hold on;
A2 = double(imread(addr2_newPic));
newA = zeros(size(A2));
mus = double(gmodel.mu);
ran = zeros(4,numel(A2(:,:,1)),3);
ran(1,:,:) = random(gm1,numel(A2(:,:,1)));
ran(2,:,:) = random(gm2,numel(A2(:,:,1)));
ran(3,:,:) = random(gm3,numel(A2(:,:,1)));
ran(4,:,:) = random(gm4,numel(A2(:,:,1)));
for i=1:numel(A2(:,1))
    for j = 1:numel(A2(1,:,1))
        xt = repmat(reshape(A2(i,j,:),1,3),4,1);
        [M,idx] = min(sum((xt-mus).^2,2));
        newA(i,j,:) = ran(idx,i+(j-1)*numel(A2(:,1,1)),:);
        newA(i,j,:) = projectOnLine(newA(i,j,:) , A2(i,j,:) , mus(idx));
    end
end
ta = uint8(newA);
%  [centroids, weights] = rgb2CentsWeights(ta);
%  drawWeightsColors(centroids, weights, 2000);


end

