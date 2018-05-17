function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

values=[ 0.01 0.03 0.1 0.3 1 3 10 30];
C=100000;

for c_n=1:length(values)
	for sigma_n=1:length(values)

		m=svmTrain(X,y, values[c_n], @(x1,x2) gaussianKernel(X,y,values[sigma_n]) );
		predictions= svmPredict(model,Xval);
		prediction=mean(double(predictions ~= yval ) );
		if prediction < C;
			C = values[c_n];
			sigma = values[sigma_n];
		end
	end
end


%bestPrediction = 1000;
%for C_i = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]
%  for sigma_i = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]
%    model= svmTrain(X, y, C_i, @(x1, x2) gaussianKernel(x1, x2, sigma_i));
%    predictions = svmPredict(model, Xval);
%    prediction = mean(double(predictions ~= yval));
%    if prediction < bestPrediction;
%      bestPrediction = prediction;
%      C = C_i;
%      sigma = sigma_i;
%    end
%  end
%end





% =========================================================================

end