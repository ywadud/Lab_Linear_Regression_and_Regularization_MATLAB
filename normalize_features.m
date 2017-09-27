%%% normalize_features
% Written by Raymond Phan, Ryerson University
% January 11, 2016
%
% This function takes in a matrix of data points where each row is a point
% and each column is a feature and normalizes each feature of a point
% so that the mean and standard deviation of each feature over all 
% points is 0 and 1 respectively.
%
% This is achieved by taking each point x_i and transforming it so that:
%
% x_i_new = (x_i - mu_i) / sigma_i
%
% mu_i and sigma_i are the mean and standard deviation of the feature i in
% the data set.
%
% Inputs:
% X - A m x n matrix where m is the total number of points and n is the
% total number of features.
%
% IMPORTANT NOTE: DO NOT ADD A COLUMN OF ONES TO YOUR DATA BEFORE RUNNING
% THIS CODE
%
% Outputs:
% Xn - The normalized data
%
% mu - A 1 x n (row vector) array of means where each element is the
% mean of a feature given the input data matrix X
%
% sigma - A 1 x n (row vector) array of standard deviations where each
% element is the standard deviation of a feature given the input data
% matrix X
%
% Example use:
%
% [Xp,mu,sigma] = normalize_features(X)
% Xp = [ones(size(Xp,1), 1) Xp]; %% Add a column of ones now

function [X, mu, sigma] = normalize_features(X)
     mu = mean(X, 1);
     sigma = std(X,[],1);
     X = bsxfun(@minus, X, mu);
     X = bsxfun(@rdivide, X, sigma);