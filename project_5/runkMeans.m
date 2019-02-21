function [centroids, idx] = runkMeans(X, initial_centroids, max_iters)

% Initialize values
[m n] = size(X);
K = size(initial_centroids, 1);
centroids = initial_centroids;
idx = zeros(m, 1);

% Run K-Means
for i=1:max_iters
    i
    idx = findClosestCentroids(X, centroids); 
    fprintf('found closesst');
    centroids = computeCentroids(X, idx, K);
end
idx = findClosestCentroids(X, centroids);
end

