function dists = dists( points, centroids )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
dists = zeros(numel(points(:,1),numel(centroids(:,1))));
cents = centroids(:);
dists2 = repmat(dists,1,numel(centroids(:,1)));

end

