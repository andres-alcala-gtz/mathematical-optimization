% Reset
clear all;
close all;
clc;

% Test
% dimension = 2;
% range = 5;
% extra = {};

% Kinematic
dimension = 4;
range = 160;
position_i = [+0.0, +0.0];
position_o = [-0.5, -0.5];
link = abs(0.35) .* ones(1, dimension);
extra = {link, position_i, position_o};

% Bound
bound_lower = -abs(range) .* ones(1, dimension);
bound_upper = +abs(range) .* ones(1, dimension);

% Function
% function_u = @(x) function_test(x);
function_u = @(x) function_distance(function_kinematic(x, link, position_i), position_o);
function_p = @(x) function_penalty(x, bound_lower, bound_upper);
function_o = @(x) (function_u(x)) + (1000 * function_p(x));

% Algorithm
solution = teaching_learning_based_optimization(dimension, function_o, bound_lower, bound_upper, 100, 10, extra);

% Solution
disp(solution);