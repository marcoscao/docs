function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);


fprintf('J_history size: ' ); 
disp(size(J_history));


for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %

	if( iter>1 )
	{
		fprintf('theta: %f\n', theta);
		% fprintf('old computeCost %d : %f\n', iter-1, J_history(iter-1) ); 
		fprintf('computeCost %d : \n',iter-1 ); 
		disp( J_history(iter-1));

		pred=X*theta;
		% theta=theta - alpha * (1/m) * sum( pred - y ) * X;
		theta = theta - ( (alpha/m) * sum( (pred - y )' * X ) ); %alpha * (1/m) * sum( (pred - y)' * X );
	 	%disp(theta);
	}

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

	 %disp(J_history(iter));
end

end
