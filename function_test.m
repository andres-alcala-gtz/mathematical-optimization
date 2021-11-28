function [fx] = function_test(x)

    d = length(x);
    [m, n] = size(x{d});
    fx = zeros(m, n);

    for i=1 : d

        % Sphere
        % fx = (fx) + (x{i} .^ 2);

        % Rastrigin
        fx = (fx) + (x{i} .^ 2) - (10 * cos(2 * pi * x{i}));

    end

end