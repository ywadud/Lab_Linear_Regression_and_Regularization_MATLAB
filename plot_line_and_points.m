%%% plot_line_and_points
% Written by Raymond Phan, Ryerson University
% January 11, 2016
%
% This function takes in a column vector of input points (x) and desired
% output points (y) as well as the range of values you want to examine
% stored in the minimum and maximum x value, as well as the parameters of
% the first-order line of best fit to plot these input/output points
% as well as the line that best goes through these points
%
% Inputs: 
% x - Input data - m x 1 column vector
% y - Output labels - m x 1 column vector
% minX - Smallest x value you want to plot
% maxX - Largest x value you want to plot
% theta - 2 x 1 vector of parameters that represent the parameters of the
% line
%
% Outputs: None - Shows a plotted figure only
%
% Example use: 
%
% Assuming you ran Gradient Descent and have found the parameters theta:
%
% plot_line_and_points(x, y, min(x), max(x), theta); 

function plot_line_and_points(x, y, minX, maxX, theta)

    % Find a range of points from the smallest to largest x value
    xx = linspace(minX, maxX).';

    % Compute the predictions
    % This code is equivalent to doing yy = theta(1) + theta(2)*xx;
    % in the case of linear regression
    xp = [ones(numel(xx),1) xx];
    yy = xp*theta;

    % Plot the points and the line
    figure;
    plot(x, y, 'rx', xx, yy, 'b', 'MarkerSize', 16);
    title(sprintf('Plotted points and line of best fit: %f + %f x', ...
        theta(1), theta(2)));