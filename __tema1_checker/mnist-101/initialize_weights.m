function [matrix] = initialize_weights(L_prev, L_next)
  % L_prev -> the number of units in the previous layer
  % L_next -> the number of units in the next layer

  % matrix -> the matrix with random values
  
  % TODO: initialize_weights implementation
  
  matrix = zeros(L_next, L_prev + 1);
  
  e = sqrt(6) / sqrt(L_next + L_prev);
  for i = 1:L_next
    for j = 1:L_prev + 1
      if e < 0
        matrix(i, j) = ((-1) * e - e) * rand() + e;
      else
        matrix(i, j) = (e + e) * rand() - e;
      endif
    endfor
  endfor  
endfunction
