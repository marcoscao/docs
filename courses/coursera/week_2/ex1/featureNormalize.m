function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% You need to set these values correctly
X_norm = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));

% ====================== YOUR CODE HERE ======================
% Instructions: First, for each feature dimension, compute the mean
%               of the feature and subtract it from the dataset,
%               storing the mean value in mu. Next, compute the 
%               standard deviation of each feature and divide
%               each feature by it's standard deviation, storing
%               the standard deviation in sigma. 
%
%               Note that X is a matrix where each column is a 
%               feature and each row is an example. You need 
%               to perform the normalization separately for 
%               each feature. 
%
% Hint: You might find the 'mean' and 'std' functions useful.
%       
[rows,cols]=size(X);
%mu = mean(X,1);
sigma = std(X,1);

for i=1:cols
	mu(i) = sum(X(:,i)) / rows;
	%sigma(i) = max(X(:,i)) - min(X(:,i));

	% disp(feature_sum);
	X_norm(:,i) = X(:,i) .- mu(i);
	X_norm(:,i) = X_norm(:,i) ./ sigma(i);

	%disp("--------------------------------------------------");
	disp("Feature i: Mean and Standard Deviation");
	disp(mu(i));
	disp(sigma(i));

	disp("Training example 2, feature i. Real value and normalized one");
	disp(X(2,i));
	disp(X_norm(2,i));
	disp(" ");
	%disp("--------------------------------------------------");
end


% ============================================================

end
