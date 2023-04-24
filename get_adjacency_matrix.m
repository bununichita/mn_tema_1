function [Adj] = get_adjacency_matrix(Labyrinth)
  m = rows(Labyrinth);
  n = columns(Labyrinth);
  new_m = m * n;
  new_n = m * n;
  Adj = zeros(new_m + 2, new_n + 2);
  for i = 1:m
    for j = 1:n
      curr = (i - 1) * n + j;
      if Labyrinth(i, j) < 8
        if i == 1
          Adj(curr, new_n + 1) = 1;
        else
          index = (i - 2) * n + j;
          Adj(curr, index) = 1;
        endif
      endif
      if rem(floor(Labyrinth(i, j) / 4), 2) == 0
        if i == m
          Adj(curr, new_n + 1) = 1;
        else
          index = i * n + j;
          Adj(curr, index) = 1;
        endif         
      endif
      if rem(floor(Labyrinth(i, j) / 2), 2) == 0
        if j == n
          Adj(curr, new_n + 2) = 1;
        else
          index = (i - 1) * n + j + 1;
          Adj(curr, index) = 1;
        endif        
      endif
      if rem(Labyrinth(i, j), 2) == 0
        if j == 1
          Adj(curr, new_n + 2) = 1;
        else
          index = (i - 1) * n + j - 1;
          Adj(curr, index) = 1;
        endif        
      endif
    endfor
  endfor
  Adj(new_n + 1, new_n + 1) = 1;
  Adj(new_n + 2, new_n + 2) = 1;
endfunction