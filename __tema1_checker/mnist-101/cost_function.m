function [J, grad] = cost_function(params, X, y, lambda, ...
                   input_layer_size, hidden_layer_size, ...
                   output_layer_size)
  
  n = numel(params);
  s1 = input_layer_size;
  s2 = hidden_layer_size;
  s3 = output_layer_size;
  Theta1 = reshape(params(1:s2 * (s1 + 1)), s2, s1 + 1);
  Theta2 = reshape(params(s2 * (s1 + 1) + 1:n), s3, s2 + 1);
  
  m = size(X, 1);
  bias = ones(m, 1);
  a1 = [bias, X];
  z2 = a1 * Theta1';
  a2 = sigmoid(z2);
  a2 = [bias, a2];
  z3 = a2 * Theta2';
  a3 = sigmoid(z3);
  
y_0 = eye(output_layer_size)(y,:);
  y = y_0;
  delta3 = a3 - y;
  delta2 = (delta3 * Theta2) .* ([bias, sigmoid(z2)] .* [bias, (1 - sigmoid(z2))]);
  delta2 = delta2(:, 2:end);
  Theta2_grad = (delta3' * a2);
  Theta1_grad = (delta2' * a1);
  
  J = sum(sum(-y .* log(a3) - (1 - y) .* log(1 - a3))) / m;
  
  regularization_term = (lambda / (2 * m)) * (sum(sum(Theta1(:, 2:end) .^ 2)) + sum(sum(Theta2(:, 2:end) .^ 2)));
  
  J = J + regularization_term;
  Theta2_grad = Theta2_grad /m;
  Theta2_grad(:,2:end) = Theta2_grad(:,2:end) + (lambda / m) * Theta2(:,2:end);
  Theta1_grad = Theta1_grad /m;
  Theta1_grad(:,2:end) = Theta1_grad(:,2:end) + (lambda / m) * Theta1(:,2:end);
  
  grad = [Theta1_grad(:); Theta2_grad(:)];
endfunction