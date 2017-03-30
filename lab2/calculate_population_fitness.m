function [ output_args ] = calculate_population_fitness( population, fitness_func )
    population_size = size(population, 1);
    
    for i = 1 : population_size
        fenotype = bin2dec(population(i).genotype);
        population(i).fitness = fitness_func(fenotype);
    end
end

