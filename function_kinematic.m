function [position_final] = function_kinematic(joint, link, position_initial)

    d = length(joint);
    [m, ~] = size(joint{d});

    angle = zeros(m, 1);
    position = position_initial .* ones(m, 2);

    for i=1 : d

        angle = (angle) + (joint{i});
        position(:, 1) = (position(:, 1)) + (link(i) * cosd(angle));
        position(:, 2) = (position(:, 2)) + (link(i) * sind(angle));

    end

    position_final = position;

end