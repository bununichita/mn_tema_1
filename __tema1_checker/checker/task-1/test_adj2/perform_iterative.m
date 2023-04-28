function [x, err, steps] = perform_iterative(G, c, x0, tol, max_steps)
  
  err = inf;
  steps = 0;
  while err >= tol && steps <= max_steps
    aux = x0;
    x0 = G * x0 + c;
    aux = abs(aux - x0);
    err = norm(aux);
    steps++;
  endwhile
  x = x0;
endfunction