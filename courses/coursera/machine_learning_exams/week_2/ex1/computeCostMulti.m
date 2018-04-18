function J = computeCostMulti(X, y, theta)
%COMPUTECOSTMULTI Compute cost for linear regression with multiple variables
%   J = COMPUTECOSTMULTI(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.


% add ones column if features is below theta parameters in one
features = size(X,2);
if( features == 1 )
	X=[ones(size(X,1),1) X];
endif


h=X*theta;

% computing J using the usual way
J1=1/(2*m)*sum( (h-y).^2);

% computing J using matrix multiplication ( see ex1.pdf )
a=(h-y)'*(h-y);
J=1/(2*m)*a;

%disp(J1);
%disp(J2);


% =========================================================================

end
