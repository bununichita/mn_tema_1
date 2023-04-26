function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  % InitialMatrix -> the matrix that must be transformed

  % FeatureMatrix -> the matrix with all training examples
  
  % TODO: prepare_for_regression implementation
  m = rows(InitialMatrix);
  n = columns(InitialMatrix);
  FeatureMatrix = cell(m, n);
  for i = 1:m
    for j = 1:n
        if strcmp(InitialMatrix{i, j}, "yes")
          FeatureMatrix{i, j} = 1;
        elseif strcmp(InitialMatrix{i, j}, "no")
          FeatureMatrix{i, j} = 0;
        elseif strcmp(InitialMatrix{i, j}, "semi-furnished")
          FeatureMatrix{i, j} = [1, 0];
        elseif strcmp(InitialMatrix{i, j}, "unfurnished")
          FeatureMatrix{i, j} = [0, 1];
        elseif strcmp(InitialMatrix{i, j}, "furnished")
          FeatureMatrix{i, j} = [0, 0];
        else
          FeatureMatrix{i, j} = InitialMatrix{i, j};
        endif
    endfor
  endfor
endfunction