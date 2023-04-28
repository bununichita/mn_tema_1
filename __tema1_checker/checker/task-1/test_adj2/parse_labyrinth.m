function [Labyrinth] = parse_labyrinth(file_path)
  in = fopen(file_path, "r");
  if (in == -1)
    error('Failed to open file');
  end
  m = fscanf(in, "%d", 1);
  n = fscanf(in, "%d", 1);
  Labyrinth = dlmread(file_path, ' ', 1, 0);
  fclose(in);
endfunction