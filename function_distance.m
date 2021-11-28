function [distance] = function_distance(position_initial, position_final)

    [m, ~] = size(position_initial);
    distance = zeros(m, 1);

    for i=1 : m

        distance(i) = norm(position_initial(i, :) - position_final(i, :));

    end

end