function [Y, InitialMatrix] = parse_data_set_file(file_path)
  % path -> a relative path to the .txt file

  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed
  
  % TODO: parse_data_set_file implementation
  %file_path = "input.txt"
  
  
  in = fopen(file_path, "r");
  if (in == -1)
    error('Failed to open file');
  end
  m = fscanf(in, "%d", 1);
  n = fscanf(in, "%d", 1);
  n++;
  InitialMatrix = cell(m, n);
  for i = 1:m
    for j = 1:n
      InitialMatrix(i, j) = fscanf(in, "%s", 1);
    endfor
  endfor
  fclose(in);
  Y = InitialMatrix(1:m, 1:1);
  aux = str2double(Y);
  Y = aux;
  InitialMatrix = InitialMatrix(1:m, 2:n);
  
endfunction