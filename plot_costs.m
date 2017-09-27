%%% plot_costs
% Written by Raymond Phan, Ryerson University
% January 11, 2016
%
% This function takes in an array of costs that is returned by any of the
% linear regression algorithms you wrote for Lab #1 and it plots the cost
% as a function of the total number of iterations
%
% Inputs:
% costs - A N x 1 column vector of costs where N is the total amount of
% iterations taken from any of the algorithms you wrote for this lab
%
% Outputs: None - Only shows a plot
%
% Example use:
% Assuming you ran Gradient Descent and have found the costs:
%
% plot_costs(costs)

function plot_costs(costs)
    N = numel(costs);
    figure;
    plot(1:N, costs, 'b', 'MarkerSize', 16);
    xlabel('Iteration number');
    ylabel('Cost: J(\theta)');
    title('Cost function output vs. the # of iterations');
    grid;    