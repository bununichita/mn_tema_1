function [G, c] = get_Jacobi_parameters(Link)
  dim = rows(Link);
  dim = dim - 2;
  G = spalloc(dim, dim, dim * 4 + 2);
  G = Link(1:dim, 1:dim);
  c = spalloc(dim, 1, dim);
  c = Link(1:dim, dim + 1:dim + 1);
  
endfunction