function loss=L(X,t,K,omega)
%this is the loss function
loss=0;
[D, N] = size(X);
%add the loss of each row
for i=1:D
     loss=loss+1/(1+exp(K*t(i)*X(i,:)*omega'));
end
loss = loss/D;
end