function [Y, InitialMatrix] = parse_data_set_file(file_path)
  % path -> a relative path to the .txt file

  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed
  
  % TODO: parse_data_set_file implementation
  in = fopen(file_path, "r");
  if (in == -1)
    error('Failed to open file');
  end
  m = fscanf(in, "%d", 1);
  n = fscanf(in, "%d", 1);
  InitialMatrix = dlmread(file_path, ' ', 1, 0);
  fclose(in);
  Y = InitialMatrix(1:m, 1:1);
  
endfunction