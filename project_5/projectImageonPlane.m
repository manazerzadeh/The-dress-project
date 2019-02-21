function img = projectImageonPlane(addr,coef)
figure;
[A,map] = imread(addr);
if ~isempty(map)
    A = ind2rgb(A,map);
end
A = double(A);
coef = double(coef);
r = A(:,:,1);
g = A(:,:,2);
b = A(:,:,3);
r = r(:);
g = g(:);
b = b(:);
X = [r,g,b];
projs = projectOnPlane(X,coef(1),coef(2),coef(3),coef(4));
s = size(A(:,:,1));
A(:,:,1) = reshape(projs(:,1),s(1),s(2));
A(:,:,2) = reshape(projs(:,2),s(1),s(2));
A(:,:,3) = reshape(projs(:,3),s(1),s(2));
img = uint8(A);
image(img);
end