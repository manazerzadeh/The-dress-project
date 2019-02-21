function centroids = computeCentroids(X, idx, K)

[m n] = size(X);

centroids = zeros(K, n);

for i= 1:K
    xd = (idx == i);
    n1 = sum(xd);
    centroids(i,:) = ((X'*xd)./n1)';
end



% =============================================================


end

