function [] = figure_mesh(id, x, xl, xu)

    [x1, x2] = meshgrid(linspace(xl(1), xu(1)), linspace(xl(2), xu(2)));
    [x3] = function_test({x1, x2});
    fx = function_test({x(:, 1), x(:, 2)});

    figure(id);

    cla;
    hold on;
    grid on;

    mesh(x1, x2, x3);
    plot3(x(:, 1), x(:, 2), fx, 'xr', 'LineWidth',2);

    drawnow;

end