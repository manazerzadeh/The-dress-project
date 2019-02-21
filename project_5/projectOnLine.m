function Y = projectOnLine(rand , X , mu)
%project random number on the line connecting X and mu
X = reshape(X , 1 , 3);
rand = reshape(rand , 1 , 3);
a = mu - X;
b = rand - X;
Y = X + a*( sum(a .* b) / sum( a .* a));
end
