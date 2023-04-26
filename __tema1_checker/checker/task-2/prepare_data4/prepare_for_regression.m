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
          FeatureMatrix{i, j} = 1;
          FeatureMatrix{i, j + 1} = 0;
        elseif strcmp(InitialMatrix{i, j}, "unfurnished")
          FeatureMatrix{i, j} = 0;
          FeatureMatrix{i, j + 1} = 1;
        elseif strcmp(InitialMatrix{i, j}, "furnished")
          FeatureMatrix{i, j} = 0;
          FeatureMatrix{i, j + 1} = 0;
        else
          FeatureMatrix{i, j} = str2num(InitialMatrix{i, j});
        endif
    endfor
  endfor
  FeatureMatrix;
  FeatureMatrix = cell2mat(FeatureMatrix);
endfunction