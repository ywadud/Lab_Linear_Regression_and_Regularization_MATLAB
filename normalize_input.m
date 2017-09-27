%%% normalize_input
% Written by Raymond Phan, Ryerson University
% January 11, 2016
%
% This function takes in a matrix of data points as well as the
% pre-computed means and standard deviations of each feature of a data
% point and normalizes this matrix as a pre-processing step for using in
% regression algorithms with Gradient Descent.
%
% Inputs:
% X - A m x n matrix where m is the total number of points and n is the
% total number of features.
%
% IMPORTANT NOTE: DO NOT ADD A COLUMN OF ONES TO YOUR DATA BEFORE RUNNING
% THIS CODE
%
% mu - A 1 x n (row vector) array of means where each element is the
% pre-computed mean of a feature.
%
% sigma - A 1 x n (row vector) array of standard deviations where each
% element is the pre-computed standard deviation of each feature.
%
% Outputs:
%
% Xn - The normalized data
%
% Example use:
%
% Assuming you ran normalize_features to retrieve the mean and standard
% deviation of each feature from a dataset:
%
% %% Original training data stored in X
% [Xp,mu,sigma] = normalize_features(X)
%
% ...
% ...
%
% %% New data set is stored in XX
% XXn = normalize_input(XX, mu, sigma);
% XXn = [ones(size(XXn,1), 1) XXn]; %% Add a column of ones now
% ...
% ...

function [Xn] = normalize_input(X, mu, sigma)
    Xn = bsxfun(@minus, X, mu);
    Xn = bsxfun(@rdivide, Xn, sigma);