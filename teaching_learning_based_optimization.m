function [solution] = teaching_learning_based_optimization(dimension, function_objective, bound_lower, bound_upper, generation, population, extra)

    % Convergence
    convergence = zeros(generation, 1);

    % Initialization
    individuals = zeros(population, dimension);
    evaluations = zeros(population, 1);
    for p=1 : population
        individuals(p, :) = unifrnd(bound_lower, bound_upper);
        evaluations(p   ) = function_objective(num2cell(individuals(p, :)));
    end

    % Loop
    for g=1 : generation

        for p=1 : population

            % Teaching

            [~, index_teacher] = min(evaluations);
            teaching_factor = randi(2);

            individual_new = zeros(1, dimension);
            for d=1 : dimension
                individual_new(d) = (individuals(p, d)) + ((rand()) * ((individuals(index_teacher, d)) - (teaching_factor * mean(individuals(:, d)))));
            end
            evaluation_new = function_objective(num2cell(individual_new));

            if evaluation_new < evaluations(p)
                individuals(p, :) = individual_new;
                evaluations(p   ) = evaluation_new;
            end

            % Learning

            index_random = randperm(population);
            index_random(index_random == p) = [];
            index_random = index_random(1);

            individual_new = zeros(1, dimension);
            if evaluations(p) < evaluations(index_random)
                for d=1 : dimension
                    individual_new(d) = (individuals(p, d)) + ((rand()) * (individuals(p, d) - individuals(index_random, d)));
                end
            else
                for d=1 : dimension
                    individual_new(d) = (individuals(p, d)) + ((rand()) * (individuals(index_random, d) - individuals(p, d)));
                end
            end
            evaluation_new = function_objective(num2cell(individual_new));

            if evaluation_new < evaluations(p)
                individuals(p, :) = individual_new;
                evaluations(p   ) = evaluation_new;
            end

        end

        % Convergence
        convergence(g) = min(evaluations);

        % Figure
        figure_convergence(1, convergence(1 : g));
        % figure_plot(2, individuals, bound_lower, bound_upper);
        % figure_contour(3, individuals, bound_lower, bound_upper);
        % figure_mesh(4, individuals, bound_lower, bound_upper);
        figure_kinematic(5, individuals, extra{1}, extra{2}, extra{3});

    end

    % Solution
    [evaluation_best, index_best] = min(evaluations);
    [individual_best] = individuals(index_best, :);
    solution = [individual_best, evaluation_best];

end