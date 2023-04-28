function [Link] = get_link_matrix(Labyrinth)
  m = rows(Labyrinth);
  n = columns(Labyrinth);
  if m == 1 || n == 1
    nr_values = m * n * 4;
  else
    frontier = 2 * n + 2 * (m - 2);
    nr_values = m * n * 4 + 2;
  endif
  new_m = m * n;
  new_n = m * n;
  Link = spalloc(new_m, new_n, nr_values);
  for i = 1:m
    for j = 1:n
      curr = (i - 1) * n + j;
      neigh = 0;
      if Labyrinth(i, j) < 8
        neigh++;
      endif
      if rem(floor(Labyrinth(i, j) / 4), 2) == 0
        neigh++;         
      endif
      if rem(floor(Labyrinth(i, j) / 2), 2) == 0
        neigh++;
      endif
      if rem(Labyrinth(i, j), 2) == 0
        neigh++;
      endif
      if Labyrinth(i, j) < 8
        if i == 1
          Link(curr, new_n + 1) = 1 / neigh;
        else
          index = (i - 2) * n + j;
          Link(curr, index) = 1 / neigh;
        endif
      endif
      if rem(floor(Labyrinth(i, j) / 4), 2) == 0
        if i == m
          Link(curr, new_n + 1) = 1 / neigh;
        else
          index = i * n + j;
          Link(curr, index) = 1 / neigh;
        endif         
      endif
      if rem(floor(Labyrinth(i, j) / 2), 2) == 0
        if j == n
          Link(curr, new_n + 2) = 1 / neigh;
        else
          index = (i - 1) * n + j + 1;
          Link(curr, index) = 1 / neigh;
        endif        
      endif
      if rem(Labyrinth(i, j), 2) == 0
        if j == 1
          Link(curr, new_n + 2) = 1 / neigh;
        else
          index = (i - 1) * n + j - 1;
          Link(curr, index) = 1 / neigh;
        endif        
      endif
    endfor
  endfor
  Link(new_n + 1, new_n + 1) = 1;
  Link(new_n + 2, new_n + 2) = 1;
endfunction