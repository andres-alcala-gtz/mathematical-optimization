function [] = figure_kinematic(identifier, joint, link, position_initial, position_objective)

    [m, n] = size(joint);

    positions = cellmat(1, 2, m, n+1, 0);
    positions{1}(:, 1) = position_initial(1);
    positions{2}(:, 1) = position_initial(2);

    for i=1 : n

        position = function_kinematic(mat2cell(joint(:, 1 : i), m, ones(1, i)), link(1 : i), position_initial);
        positions{1}(:, i+1) = position(:, 1);
        positions{2}(:, i+1) = position(:, 2);

    end

    figure(identifier);

    cla;
    hold on;
    grid on;

    axis([-1, +1, -1, +1]);
    plot(position_objective(1), position_objective(2), 'xg', 'LineWidth',2);

    for i=1 : m

        plot(positions{1}(i, :), positions{2}(i, :), '-k', 'LineWidth',2);

    end

    drawnow;

end