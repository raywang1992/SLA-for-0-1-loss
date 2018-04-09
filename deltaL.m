function grad = deltaL(X,t,K,omega)

%this function represents the gradient of the loss
[D, N] = size(X);
grad = zeros(1,N);
for i=1:D
    grad = grad-K*t(i)*X(i,:)*L(X,t,K,omega)*(1-L(X,t,K,omega))/D;
end
