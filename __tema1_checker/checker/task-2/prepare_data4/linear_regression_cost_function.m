function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples

  % Error -> the error of the regularized cost function

  % TODO: linear_regression_cost_function implementation
  
  m = rows(FeatureMatrix);
  n = columns(FeatureMatrix);
  %{
  for i = 1:m
  
    h(i) = FeatureMatrix(i, :) * Theta;
  endfor
  %}
  h = FeatureMatrix * Theta;
  %{
  for i = 1:m
    h(i) = 0;
    for j = 1:n
      h(i) = h(i) + Theta(i) * FeatureMatrix{i, j};
    endfor
  endfor
  %}
  s = 0;
  for i = 1:m
    dif = h(i) - Y(i);
    dif = dif * dif';
    s = s + dif;
  endfor
  
  Error = 1 / (2 * m) * s;
  
endfunction