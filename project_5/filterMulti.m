function newX = filterMulti( X, points1 , scale)
X = double(X);
points1 = double(points1);
size(X);
size(points1);
Xk = repmat(X, 1, numel(points1(:,1)));
points = points1';
points = points(:)';
points = repmat(points,numel(Xk(:,1)),1);
dists = (Xk - points).^2;
r = zeros(numel(X(:,1)), numel(points1(:,1)));
dim = numel(points1(1,:));
for i = 1:numel(points1(:,1))
    r(:,i) = sum(dists(:,dim*(i-1)+1:dim*i),2);
end
[M, idx] = min(r,[],2);

% scale
size(idx);
size(X);
size(points1(idx));

newX = X*(1-scale) + scale*points1(idx,:);
end

