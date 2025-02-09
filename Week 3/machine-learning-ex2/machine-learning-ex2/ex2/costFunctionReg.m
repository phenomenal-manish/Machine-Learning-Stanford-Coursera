function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

%DIMENSIONS: 
%   theta = (n+1) x 1
%   X     = m x (n+1)
%   y     = m x 1
%   grad  = (n+1) x 1
%   J     = Scalar
 
z = X * theta;            % m x 1
h_thetha_x = sigmoid(z);  % m x 1

regularization_term = (lambda/ (2* m) ) * ((theta(2:end))' * theta(2:end)) ;

J = ((-1/m) * sum(( y.* log(h_thetha_x)) + ( (1-y).* log(1-h_thetha_x)))) + regularization_term; %scalar

error = h_thetha_x - y;          % m x 1 
grad(1) = (1/m) * ((X(:,1))' * error);     % 1 x 1
grad(2:end) = (1/m) * ((X(:,2:end))' * error) + (lambda/m) * theta(2:end);  % n x 1 



% =============================================================

end
