%%% create_plots
% Written by Raymond Phan, Ryerson University
% January 9, 2016
%
% Demonstrates how to plot contour plots and surface plots of the cost
% function using univariate linear regression
%
% This is a demonstrate script, simply run it and you'll see the output
% figures seen in the Lab #1 document

% Clear all variables and close all windows
clearvars;
close all;

%%% Figure 2
% Compute line of best fit parameters via gradient descent
x = [1;2;3]; % Training data
y = [2;4;5];

initial_theta = [0; 0]; % Initial parameters
N = 50; % Number of iterations
alpha = 0.01; % Learning rate

[theta, costs] = linear_regression(x, y, alpha, initial_theta, N);

%%% Figure 3
plot_line_and_points(x, y, min(x), max(x), theta); 

%%% Figure 4
plot_costs(costs);

%%% Figure 5
m = numel(x);
[X,Y] = ndgrid(-2:0.01:2, -2:0.01:2);
Z = zeros(size(X));
for ii = 1 : size(X,1)
   for jj = 1 : size(X,2)
      theta0 = X(ii,jj);
      theta1 = Y(ii,jj);
      Z(ii,jj) = (0.5/m)*sum((theta0 + theta1*x - y).^2);
   end
end

figure;
surf(X,Y,Z);
xlabel('\theta_0'); ylabel('\theta_1'); zlabel('J(\theta_0, \theta_1)');
axis ij;
shading interp;

%%% Section to show contour plot
figure;
contour(X, Y, Z, logspace(-2,2,20));
xlabel('\theta_0'); ylabel('\theta_1');
colorbar;