function [path] = heuristic_greedy(start_position, probabilities, Adj)
  probabilities(end + 1, 1) = 1;
  probabilities(end + 1, 1) = 0;
  dim = rows(Adj) - 2;
  visited = spalloc(1, dim + 1, dim + 1);
  path = [];
  path(1) = start_position;
  visited(1, start_position) = 1;
  while columns(path)
    position = path(end);
    if position == dim + 1
      break;
    endif
    max_prob = 0;
    max_index = -1;
    for i = 1:dim + 1
      if Adj(position, i) && !visited(1, i)
        if probabilities(i, 1) > max_prob
          max_prob = probabilities(i, 1);
          max_index = i;
        endif
      endif
    endfor
    if max_prob < 0
      path(end) = [];
    else
      neigh = max_index;
      visited(1, neigh) = 1;
      path(columns(path) + 1) = neigh;
    endif
  endwhile
  path = path';
endfunction