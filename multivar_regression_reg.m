%%% multivar_regression_reg.m
%
% Function that performs multivariable linear regression with regularization
% using Gradient Descent
%
% Inputs:
%  x - Data matrix of points of size m x (n + 1)
%      Each row is a point and each column is a feature
%      The FIRST column is assumed to be 1
%      Make sure you prepend a column of 1s to the first column
%      before running
%  y - Column vector of expected outputs
%  init_theta - (n + 1) element column vector of initial parameters
%      i.e. init_theta = zeros(n+1, 1);
%  alpha - Learning rate (greater than 0)
%  lambda - Regularization parameter (greater than or equal to 0)
%      Setting lambda = 0 implements normal multivariable linear regression
%  N - Total # of iterations
%
%  Outputs:
%  theta - A two element column vector that contains the final output
%  parameters
%  costs - A N x 1 column vector of costs at each iteration

function [theta, costs] = multivar_regression_reg(X, y, init_theta, alpha, lambda, N)
    % Get total number of training examples
    m = numel(y);
    
    % Declare cost array
    costs = zeros(N, 1);
    
    % Initialize theta
    theta = init_theta;
    X = [ones(m, 1), X];
    
    [r, s] = size(theta);
    temp = zeros(r, s);
    temp(2:end) = 1 - alpha * lambda / m;
    temp(1) = 1;
        
    % Complete the logic of multivariable linear regression with
    % regularization using Gradient Descent here
    for i = 1:N
        theta = temp.*theta - (alpha/m) * (X' * (X * theta - y));
        costs(i) = (0.5 / m) * (X * theta - y).'*(X * theta - y) + (0.5 * lambda / m) * theta.'*theta;
    end
    
    % At each iteration, update the parameters simultaneously and
    % also compute the cost at each iteration   
end