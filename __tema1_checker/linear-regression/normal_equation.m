function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % tol -> the learning rate
  % iter -> the number of iterations
  % tol -> the tolerance level for convergence of the conjugate gradient method

  % Theta -> the vector of weights
  
  % TODO: normal_equation implementation
  
  m = rows(FeatureMatrix);
  n = columns(FeatureMatrix);
  
  
  b = FeatureMatrix' * Y;
  A = FeatureMatrix' * FeatureMatrix;
  Theta = zeros(n, 1);
  if A != A'
    Theta = zeros(n + 1, 1);
    return;
  endif

  values = eig(A);
  if !all(values > 0)
    Theta = zeros(n + 1, 1);
    return;
  endif
  r = b - A * Theta;
  v = r;
  x = Theta;
  tol = tol * tol;
  k = 1;
  while k < iter && r' * r > tol
    r_prev = r;
    up = r' * r;
    down = v' * A * v;
    t = up / down;
    x = x + t * v;
    r = r - t * A * v;
    up = r' * r;
    down = r_prev' * r_prev;
    s = up / down;
    v =  r + s * v;
    k++;
  endwhile
  Theta = x;
  Theta = [0; Theta];
  
endfunction