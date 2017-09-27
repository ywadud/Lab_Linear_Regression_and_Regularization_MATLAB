%%% linear_regression.m
% Written by Raymond Phan, Ryerson University
% January 9, 2016
%
% Function that performs univariate linear regression using Gradient
% Descent
%
% Inputs:
%  x - Column vector of single features
%  y - Column vector of expected outputs
%  init_theta - 2 element column vector of initial parameters
%      init_theta(1) <-- Intercept term
%      init_theta(2) <-- Slope term
%      i.e. init_theta = [0;0];
%  alpha - Learning rate (greater than 0)
%  N - Total # of iterations
%
%  Outputs:
%  theta - A two element column vector that contains the final output
%  parameters
%  costs - A N x 1 column vector of costs at each iteration
%
%  Example use: 
%  x = [1;2;3];
%  y = [2;4;5];
%  init_theta = [0;0];
%  N = 10;
%  alpha = 0.1;
%
%  [theta,costs] = linear_regression(x, y, alpha, init_theta, N);

function [theta, costs] = linear_regression(x, y, alpha, init_theta, N)

% 1. Find total number of samples
m = numel(x);

% 2. Create an array of costs
costs = zeros(m,1);

% 3. Initialize output parameters
theta = init_theta;

% 4. Perform gradient descent
for ii = 1 : N    
    % 4(a). Update parameters
    temp0 = theta(1) - (alpha/m)*sum(theta(1) + theta(2)*x - y);
    temp1 = theta(2) - (alpha/m)*sum((theta(1) + theta(2)*x - y).*x);
    theta(1) = temp0;
    theta(2) = temp1;
    
    % 4(b). Compute cost
    costs(ii) = (0.5/m)*sum((theta(1) + theta(2)*x - y).^2);    
end
