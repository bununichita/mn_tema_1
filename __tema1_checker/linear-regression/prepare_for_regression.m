function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  % InitialMatrix -> the matrix that must be transformed

  % FeatureMatrix -> the matrix with all training examples
  
  % TODO: prepare_for_regression implementation
  m = rows(InitialMatrix);
  n = columns(InitialMatrix);
  FeatureMatrix = cell(m, n + 1);
  aux = zeros(m, 1);
  poz = n;
  for i = 1:m
    for j = 1:n
        if strcmp(InitialMatrix{i, j}, "yes")
          FeatureMatrix(i, j) = 1;
        elseif strcmp(InitialMatrix{i, j}, "no")
          FeatureMatrix(i, j) = 0;
        elseif strcmp(InitialMatrix{i, j}, "semi-furnished")
          poz = j;
          FeatureMatrix(i, j) = 1;
          aux(i, 1) = 0;
        elseif strcmp(InitialMatrix{i, j}, "unfurnished")
          poz = j;
          FeatureMatrix(i, j) = 0;
          aux(i, 1) = 1;
        elseif strcmp(InitialMatrix{i, j}, "furnished")
          poz = j;
          FeatureMatrix(i, j) = 0;
          aux(i, 1) = 0;
        else
          FeatureMatrix(i, j) = str2num(InitialMatrix{i, j});
        endif
    endfor
  endfor
  
  FeatureMatrix = cell2mat(FeatureMatrix);

  if poz == n
    FeatureMatrix = [FeatureMatrix, aux];
  else
    poz++;
    FeatureMatrix = [FeatureMatrix(:, 1:poz - 1), aux, FeatureMatrix(:, poz:end)];
  endif
  
  
  
endfunction