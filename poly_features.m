%%% poly_features
% Written by Raymond Phan, Ryerson University
% January 11, 2016
%
% This function takes in a column vector of data points of size m x 1 and a
% positive integer p and returns a matrix of size m x p where each column 
% applies a power operation to each individual point where the power 
% corresponds to the column number in the matrix.
%
% Specifically, column i corresponds to x.^i where x is the input column
% vector.
%
% Inputs: 
% x - m x 1 column vector of values
% p - Desired largest power
%
% Outputs:
% xp - m x p matrix of polynomial outputs
%
% Example use:
% x = (1:10).';
% p = 8;
% y = poly_features(x, 8);

function xp = poly_features(x, p)
    xp = bsxfun(@power, x, 1:p);