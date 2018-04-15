% Calculates cost function
%
% usage:
% $ octave
% X=[1 1; 1 2; 1 3]
% y = [1; 2; 3]
% theta=[0;1]
% J=costFunction(X,y,theta)
%   should return 0
%

function J = costFunction( X, y, theta )
% X holds matrix with training examples
% y expected output
% theta

% number of training samples 
m = size(X,1);

% predictions of hypothesis for all m samples
predictions=X*theta;

% squared error
sqrErrors=(predictions-y).^2;

J = 1 / ( 2 * m ) * sum(sqrErrors);

