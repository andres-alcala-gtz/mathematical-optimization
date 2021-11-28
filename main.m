% Reset
clear all;
close all;
clc;

% Test
dimension = 2;
range = 5;

% Bound
bound_lower = -abs(range) .* ones(1, dimension);
bound_upper = +abs(range) .* ones(1, dimension);

% Function
function_u = @(x) function_test(x);
function_p = @(x) function_penalty(x, bound_lower, bound_upper);
function_o = @(x) (function_u(x)) + (1000 * function_p(x));

% Algorithm
solution = teaching_learning_based_optimization(dimension, function_o, bound_lower, bound_upper, 100, 10);

% Solution
disp(solution);