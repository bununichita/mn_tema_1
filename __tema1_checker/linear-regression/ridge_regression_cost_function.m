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
  
  s2 = sum(Theta);
  
  Error = s / (2 * m) + s2;
  %{
  m = rows(FeatureMatrix);
  n = columns(FeatureMatrix);
  Theta(1,:) = [];
  h = FeatureMatrix * Theta;
  
  dif = h - Y;
  dif = dif .
  
  s = 0;
  for i = 1:m
    dif = h(i) - Y(i);
    dif = dif * dif';
    s = s + dif;
  endfor
  
  s2 = sum(Theta);
  
  Error = 1 / (2 * m) * s + s2;
  %}
endfunction