function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples

  % Error -> the error of the regularized cost function

  % TODO: linear_regression_cost_function implementation
  %Theta = Theta';
  m = rows(FeatureMatrix);
  n = columns(FeatureMatrix);
  Theta(1,:) = [];
  h = FeatureMatrix * Theta;
  
  dim = length(h);
  
  s = 0;
  for i = 1:dim
    dif = h(i) - Y(i);
    dif = dif * dif';
    s = s + dif;
  endfor
  
  Error = 1 / (2 * m) * s;
  
endfunction