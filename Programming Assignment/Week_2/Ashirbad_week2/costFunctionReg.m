function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples
n = size(X,2);
% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

cost_vector=zeros(m,1);
h_x=sigmoid(X*theta);
cost_vector= (1-y).*log(1-h_x) + (y).*log(h_x);
J=-(ones(1,length(h_x)) * cost_vector)/m;
one=[[0] ones(1,n-1)];
J= J + ( (lambda/(2*m)) * (one*(theta.^2)) );
grad= (X' * (h_x - y))/m ;
grad= grad + ( (lambda/m) * ( one'.*theta ) );


% =============================================================

end