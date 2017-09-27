clearvars;
clear
close all
load lab1poly.mat
close all;

% Set up - Make sure you use poly_features and normalize_features to
% create polynomial features and ensure they're normalized before running
% multivariable linear regression with regularization
p = 8;
m = numel(X);
figure;
plot(X, y, 'rx', 'MarkerSize', 12)
title('Collected Test Data');
xlabel('Change in Water Level'); 
ylabel('Water Flow Rate'); 

% Create polynomial features and normalize them here
% Don't forget to add the column of ones if you are
% using the linear algebra approach

xp = poly_features(X, p);
[xp_norm, mu, sigma] = normalize_features(xp);

%%
% Perform multivariate regression with lambda = 0
lambda = 0;
N = 500;
alpha = 0.1;
init_theta = zeros(p+1, 1);

[theta, costs] = multivar_regression_reg(xp_norm, y, init_theta, alpha, lambda, N);

% Use these points to plot the line of best fit with the data points
xx = linspace(min(X) - 15, max(X) + 15).';

% Make sure you generate the polynomial features then normalize these new
% points by using the mean and standard deviation
% Don't forget to add the column of ones if you are
% using the linear algebra approach
xp_2 = poly_features(xx, p); 

% Predict new values and use plot_line_and_points as a template to plot
% the predicted values (a.k.a. the line of best fit) with the original data
% points
[xp_2, mu, sigma] = normalize_features(xp_2); 
xp_2 = [ones(numel(xx), 1) xp_2]; 
yy = xp_2 * theta;

figure;
plot(X, y, 'rx', xx, yy, 'MarkerSize', 12);
title('Fitted Line at Lambda=0');
xlabel('Change in Water Level'); 
ylabel('Water Flow Rate'); 

% Plot the costs too
plot_costs(costs); 
title('Cost Function at Lambda=0');

%%
% Repeat the above for lambda = 1
lambda = 1;
N = 500;
alpha = 0.1;
init_theta = zeros(p+1, 1);

[theta, costs] = multivar_regression_reg(xp_norm, y, init_theta, alpha, lambda, N);

% Use these points to plot the line of best fit with the data points
xx = linspace(min(X) - 15, max(X) + 15).';

xp_2 = poly_features(xx, p); 

[xp_2, mu, sigma] = normalize_features(xp_2); 
xp_2 = [ones(numel(xx), 1) xp_2]; 
yy = xp_2 * theta;

figure;
plot(X, y, 'rx', xx, yy, 'MarkerSize', 12);
title('Fitted Line at Lambda=1');
xlabel('Change in Water Level'); 
ylabel('Water Flow Rate'); 

% Plot the costs too
plot_costs(costs); 
title('Cost Function at Lambda=1');

%%
% Repeat but for lambda = 100
lambda = 100;
N = 500;
alpha = 0.1;
init_theta = zeros(p+1, 1);

[theta, costs] = multivar_regression_reg(xp_norm, y, init_theta, alpha, lambda, N);

% Use these points to plot the line of best fit with the data points
xx = linspace(min(X) - 15, max(X) + 15).';

xp_2 = poly_features(xx, p); 

[xp_2, mu, sigma] = normalize_features(xp_2); 
xp_2 = [ones(numel(xx), 1) xp_2]; 
yy = xp_2 * theta;

figure;
plot(X, y, 'rx', xx, yy, 'MarkerSize', 12);
title('Fitted Line at Lambda=100');
xlabel('Change in Water Level'); 
ylabel('Water Flow Rate'); 

% Plot the costs too
plot_costs(costs); 
title('Cost Function at Lambda=100');
