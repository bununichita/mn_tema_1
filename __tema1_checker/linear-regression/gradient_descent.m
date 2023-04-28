function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % n -> the number of predictors
  % m -> the number of trainings
  % alpha -> the learning rate
  % iter -> the number of iterations

  % Theta -> the vector of weights

  % TODO: gradient_descent implementation
  
  Theta = zeros(n, 1);
  
  %FeatureMatrix = [zeros(m, 1), FeatureMatrix];
  
  
  
  for k = 1:iter
    
    h = FeatureMatrix * Theta;
    h = h - Y;
    h = h';
    h = h * FeatureMatrix;
    h = h';
    h = 1 / m * h;
    aux = alpha * h;
    Theta = Theta - aux;
  endfor
  
  Theta = [0; Theta];
  
endfunction