function [x, err, steps] = perform_iterative(G, c, x0, tol, max_steps)
  err = inf;
  steps = max_steps;
  while err > tol && max_steps
    n = norm(x0);
    x0 = G * x0 + c;
    n1 = norm(x0);
    err = abs(n - n1);
    max_steps--;
  endwhile
  steps = steps - max_steps;
  x = x0;
endfunction