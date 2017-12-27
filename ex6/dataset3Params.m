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

set = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
matrix_values = zeros(length(set)^2,2);
matrix_errors = zeros(length(set)^2,1);

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

i = length(set);
n = 1;
for C_iter = 1:i
	for sigma_iter = 1:i
		model = svmTrain(X, y, set(C_iter), @(x1, x2) gaussianKernel(x1, x2, set(sigma_iter))); 

		predictions = svmPredict(model, Xval);

		pred_error = mean(double(predictions ~= yval));
		matrix_values(n,1) = set(C_iter);
		matrix_values(n,2) = set(sigma_iter);
		matrix_errors(n,1) = pred_error;
		++n;
	end
end

[minval, row] = min(min(matrix_errors,[],2));
C = matrix_values(row,1);
sigma = matrix_values(row,2);

% =========================================================================

end
