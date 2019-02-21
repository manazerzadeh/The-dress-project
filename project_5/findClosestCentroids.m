function idx = findClosestCentroids(X, centroids)
K = size(centroids, 1);
n = size(X,2);
idx = zeros(size(X,1), 1);
m = size(X,1);
I = 0;
M = 0;
% for i = 1:m
%     tmpX = repmat(X(i,:),K,1);
%     [M,I] = min(sum((tmpX - centroids).^2,2));
%     idx(i) = I;
% end
cents = centroids';
cents = cents(:)';
cents = repmat(cents,size(X,1),1);
Xk = repmat(X,1,K);
dists = (Xk-cents).^2;
dists = dists';
dists = reshape(dists,d,m*K);
dists = reshape(sum(dists),K,m);
dists = dists';
[M,idx] = min(dists,[],2);
end

