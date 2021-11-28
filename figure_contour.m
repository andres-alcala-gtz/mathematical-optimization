function [] = figure_contour(id, x, xl, xu)

    [x1, x2] = meshgrid(linspace(xl(1), xu(1)), linspace(xl(2), xu(2)));
    [x3] = function_test({x1, x2});

    figure(id);

    cla;
    hold on;
    grid on;

    contour(x1, x2, x3);
    plot(x(:, 1), x(:, 2), 'xr', 'LineWidth',2);

    drawnow;

end