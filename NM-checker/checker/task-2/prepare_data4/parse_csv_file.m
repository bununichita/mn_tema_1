function [Y, InitialMatrix] = parse_csv_file(file_path)
  % path -> a relative path to the .csv file
  
  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed

  % TODO: parse_csv_file implementation
  
  in = fopen(file_path, "r");
  if (in == -1)
    error('Failed to open file');
  end
  
  InitialMatrix = csvread(in);  
  fclose(in);
  m = rows(InitialMatrix);
  n = columns(InitialMatrix);
  %{
  in = fopen(file_path, "r");
  if (in == -1)
    error('Failed to open file');
  end
  InitialMatrix = cell(m, n);
  for i = 1:m
    for j = 1:n
      InitialMatrix(i, j) = fscanf(in, "%s", 1);
    endfor
  endfor
  fclose(in);
  InitialMatrix = InitialMatrix(2:m, 1:n);
  m--;
  Y = InitialMatrix(1:m, 1:1);
  InitialMatrix = InitialMatrix(1:m, 2:n);
  %}
  InitialMatrix = textread(file_path, '%s', "delimiter", ',');
  InitialMatrix = reshape(InitialMatrix, n, m);
  InitialMatrix = transpose(InitialMatrix);
  InitialMatrix = InitialMatrix(2:m, 1:n);
  m--;
  Y = InitialMatrix(1:m, 1:1);
  InitialMatrix = InitialMatrix(1:m, 2:n);
  n--;
  
endfunction