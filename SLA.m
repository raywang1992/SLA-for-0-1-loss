function [loss,omega] = SLA(X,T)
% function: SLA optimizes the relaxed sigmoid loss function
% input: X -- data matrix with size of D * N 
%        T -- label vector with size of N * 1
% output: loss -- the empirical loss of the estimated omega
%         omega -- the estimated parameter for the classifier


% first step: initialize omega by using SVM. Here, we replace it with a 
%             random vector.
model=fitclinear(X,T);
omega = [transpose(model.Beta),model.Bias];

X = [X,ones(size(X,1),1)];
[D, N] = size(X);

fprintf('The accuracy of svm:');
E(X,T,omega)
% some initial parameters
R = 8.0;
epsilonS = 0.2;
Kmin = 2;
Kmax = 200;

K = Kmin;
while K <= Kmax
   omega = GDR(X,T,omega,K,R,epsilonS);
   K = 10*K;
   R = 0.5*R;
   epsilonS = 0.5*epsilonS;
   fprintf('The loss and error of SLA in the loop:');
   loss = L(X,T,K,omega)
   E(X,T,omega)
end
end