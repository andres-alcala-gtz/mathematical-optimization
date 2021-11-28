function [] = figure_plot(id, x, xl, xu)

    x1 = linspace(xl(1), xu(1));
    x2 = function_test({x1});
    fx = function_test({x});

    figure(id);

    cla;
    hold on;
    grid on;

    plot(x1, x2, '-b', 'LineWidth',2);
    plot(x, fx, 'xr', 'LineWidth',2);

    drawnow;

end