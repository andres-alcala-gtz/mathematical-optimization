function [fx] = function_penalty(x, xl, xu)

    d = length(x);
    [m, n] = size(x{d});
    fx = zeros(m, n);

    for i=1 : d

        l = x{i} < xl(i);
        u = x{i} > xu(i);

        % fx(l) = (fx(l)) + (1);
        % fx(u) = (fx(u)) + (1);

        fx(l) = (fx(l)) + ((x{i}(l) - xl(i)) .^ 2);
        fx(u) = (fx(u)) + ((x{i}(u) - xu(i)) .^ 2);

    end

end