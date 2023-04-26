function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of 
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function

  % TODO: ridge_regression_cost_function implementation
  
  m = rows(FeatureMatrix);
  n = columns(FeatureMatrix);
  
  h = FeatureMatrix * Theta;
  s = 0;
  for i = 1:m
    x_i = FeatureMatrix(i:i, 1:n);
    x_i = insertrows(x_i, 1, 1, 1);
    x_i
    %h(i) = Theta' * 
  endfor
  %Error = 1/(2*m) * sum((h - Y) * (h - Y)) + lambda/(2*m) * sum(Theta(2:n) * Theta(2:n ));
endfunction