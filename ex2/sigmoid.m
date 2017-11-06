function g = sigmoid(z)
%SIGMOID Compute sigmoid function
%   g = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).

[heightZ,widthZ] = size(z);

for rowsZ = 1:heightZ
	for columnsZ = 1:widthZ
		g(rowsZ,columnsZ)= 1/(1 + e^(-z(rowsZ,columnsZ)));
	end
end



% =============================================================

end
