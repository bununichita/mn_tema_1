function [decoded_path] = decode_path(path, lines, cols)
  path(end) = [];
  for k = 1:rows(path)
    i = floor((path(k) - 1) / cols) + 1;
    j = rem(path(k) - 1, cols);
    decoded_path(k, 1) = i;
    decoded_path(k, 2) = j + 1;
  endfor
endfunction