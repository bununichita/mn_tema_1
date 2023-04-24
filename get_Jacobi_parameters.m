function [G, c] = get_Jacobi_parameters(Link)
  dim = rows(Link);
  dim = dim - 2;
  A = Link(1:dim, 1:dim);
  A
  
endfunction