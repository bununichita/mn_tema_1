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
  m = rows(InitialMatrix)
  n = columns(InitialMatrix)
  InitialMatrix = textread(file_path, '%s', "delimiter", ',');
  %InitialMatrix = reshape(InitialMatrix, m,n);
  aux = InitialMatrix;
  
  for i = 1:n
    for j = 1:m
      c = (j - 1) * n + i;
      InitialMatrix(j, i) = aux(c);
    endfor
  endfor
  
  %InitialMatrix = transpose(InitialMatrix);
  InitialMatrix = InitialMatrix(2:m, 1:n);
  m--;
  Y = InitialMatrix(1:m, 1:1)
  aux = str2double(Y);
  Y = aux;
  InitialMatrix = InitialMatrix(1:m, 2:n);
  n--;
  
endfunction