function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of 
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function

  % TODO: lasso_regression_cost_function implementation
  
  m = rows(FeatureMatrix);
  n = columns(FeatureMatrix);
  Theta(1,:) = [];
  h = FeatureMatrix * Theta;
  
  s = 0;
  
  aux = Y - h;
  s = sum(aux .* aux);
  
  norm = 0;
  for i = 1:n
    norm = norm + abs(Theta(i, 1));
  endfor
  Error = s / m + lambda * norm;
  
  
endfunction