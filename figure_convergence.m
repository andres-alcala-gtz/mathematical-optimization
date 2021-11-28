function [] = figure_convergence(id, fx)

    figure(id);

    cla;
    hold on;
    grid on;

    plot(fx, '-r', 'LineWidth',2);

    drawnow;

end