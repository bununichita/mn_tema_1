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
  Theta(1) = [];
  h = FeatureMatrix * Theta;
  
  aux = h - Y;
  
  aux = aux .^ 2;
  
  s = sum(aux);
  
  Theta = Theta .^ 2;
  
  s2 = lambda * sum(Theta);
  
  Error = s / (2 * m) + s2;
endfunction