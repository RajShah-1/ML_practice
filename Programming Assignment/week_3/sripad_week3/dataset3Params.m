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
predictions=[];
min=100;
cp=C;
sg=sigma;
i=0;
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
for C_test = [0.01 0.03 0.1 0.3 1 3 10 30]
    for sigma_test = [0.01 0.03 0.1 0.3 1 3 10 30]
  i=i+1;
    model= svmTrain(X, y, C_test, @(x1, x2) gaussianKernel(x1, x2, sigma_test)); 
   predictions=svmPredict(model, Xval);
        % your code goes here to train using C_test and sigma_test
        %    and compute the validation set errors
  err_value= mean(double(predictions ~= yval));
        % save the results in the matrix
        if(err_value<min)
        min=err_value;
        cp=C_test;
        sg=sigma_test;
        endif        
    endfor
endfor


C=cp;
sigma=sg;


% =========================================================================

end
