function projections = projectOnPlane(X,a,b,c,d)
x0 = [0,0,-d/c];
w = [a,b,c]/sqrt(a^2+b^2+c^2);
X0 = repmat(x0,numel(X(:,1)),1);
W = repmat(w,numel(X(:,1)),1);
projections = X - W.*repmat(sum(W.*(X-X0),2),1,3);
end