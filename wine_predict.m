%%
%%% Section 1.3
clear
close all

load lab1winedata.mat

% Select the first, third and eighth features from the training set
X = [fixedacidity, volatileacidity, citricacid, residualsugar,chlorides...
    , freesulfurdioxide,totalsulfurdioxide, density, pH, sulphates, alcohol];
Xtrain = X(:,[1 3 8]);
y = quality;

% Get number of points
m = numel(y);

% Obtain test points
id = [1, 4, 55, 126, 213, 275];
Xtest = Xtrain(id, :);
Ytest = y(id);
N = 100;
init_theta = zeros(4, 1);
alpha = 0.01;

% Complete the rest of this section by using your multivariate linear
% regression function and creating a prediction model with the inputs
% specified in the lab document.
[theta, costs] = multivar_regression(Xtrain, y, init_theta, alpha, N); 

plot_costs(costs);
title('Cost at Alpha=0.01');

% Make sure you add a column of ones to the data before training
% if you are using the linear algebra approach
Ypredict = [ones(length(id), 1), Xtest] * theta;

% After, use the test input points specified in the document to perform
% your predictions then compare these with the true quality seen in the
% dataset.
figure;
plot(1:6, Ypredict, 1:6, Ytest);
legend('Predictions', 'Actual Quality');
title('Predictions vs Actual');
xlabel('Training Example');
ylabel('Quality'); 

%%
%%% Section 1.4
clear

% Use the same data points in the previous section to normalize the
% features
load lab1winedata.mat

% Make sure you add a column of ones to the data before training and AFTER
% you normalize if you are using the linear algebra approach
X = [fixedacidity, volatileacidity, citricacid, residualsugar,chlorides...
    , freesulfurdioxide,totalsulfurdioxide, density, pH, sulphates, alcohol];
[Xbar, mu, sigma] = normalize_features(X);
Xtrain = Xbar(:,[1 3 8]);
y = quality;

% Get number of points
m = numel(y);

% Obtain test points
id = [1, 4, 55, 126, 213, 275];
Xtest = Xtrain(id, :);
Ytest = y(id);
N = 100;
init_theta = zeros(4, 1);
alpha = 0.1;

% Rerun multivariate linear regression with these new points.
[theta, costs] = multivar_regression(Xtrain, y, init_theta, alpha, N); 

plot_costs(costs);
title('Cost at Alpha=0.1');

% Again make the predictions like you did in Section 1.3 with the
% NORMALIZED test data then compare these with the true quality seen in the
% dataset and those seen in Section 1.3.
Ypredict = [ones(length(id), 1), Xtest] * theta;

figure;
plot(1:6, Ypredict, 1:6, Ytest);
legend('Predictions, Actual Quality');
title('Predictions vs Actual');
xlabel('Training Example');
ylabel('Quality'); 

%%
%%% Section 1.5
clear

alpha = [0.001, 0.003, 0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
load lab1winedata.mat

% Select the first, third and eighth features from the training set
X = [fixedacidity, volatileacidity, citricacid, residualsugar,chlorides...
    , freesulfurdioxide,totalsulfurdioxide, density, pH, sulphates, alcohol];
[Xbar, mu, sigma] = normalize_features(X);
Xtrain = Xbar(:,[1 3 8]);
y = quality;

% Get number of points
m = numel(y);

% Obtain test points
id = [1, 4, 55, 126, 213, 275];
Xtest = Xtrain(id, :); 
Ytest = y(id); 
N = 100;
init_theta = zeros(4, 1);
best_cost = 10000000;
% For each value in alpha, calculate the multivariate linear regression
% parameters using the NORMALIZED version of the training set and determine
% the final cost to use these parameters (i.e. look at the END of the cost
% array).
for i = 1:length(alpha)
    [theta, costs] = multivar_regression(Xtrain, y, init_theta, alpha(i), N); 
    if min(costs) <= best_cost
        best_cost = costs(end);
        j = i;
    end
end

% From the end costs of each of the learning rates, choose which
% one is the best learning rate then use these parameters to predict the
% qualities given the test data points seen in the lab. Compare these with
% the previous two steps.

alpha(j);
[theta, costs] = multivar_regression(Xtrain, y, init_theta, alpha(j), N)

plot_costs(costs); 
title('Costs');

Ypredict = [ones(length(id), 1), Xtest] * theta;
figure;
plot(1:6, Ypredict, 1:6, Ytest);
legend('Predictions, Actual Quality');
title('Predictions vs Actual');
xlabel('Training Example');
ylabel('Quality'); 

