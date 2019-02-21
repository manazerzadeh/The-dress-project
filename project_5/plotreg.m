function a = plotreg(centroids, bound1, bound2)
n = numel(centroids(:,1));
a = centroids;
size(a)
A = [sum(a(:,1).^2) , sum(a(:,1).*a(:,2)) , sum(a(:,1));sum(a(:,1).*a(:,2)) , sum(a(:,2).^2) , sum(a(:,2));sum(a(:,1)) , sum(a(:,2)) , n];
b = [sum(a(:,1).*a(:,3));sum(a(:,2).*a(:,3)); sum(a(:,3))];
s = linsolve(A,b)
[x y] = meshgrid(bound1:5:bound2);
Z = x*s(1) + y*s(2) + repmat(s(3),numel(x(:,1)),numel(x(:,2)));
surf(x,y,Z);

end