function [ out_population ] = make_love( population, probability )
% makes sweet love 
    
    population_size = size(population, 2);
    cross_pairing = randperm(population_size);
    
    for i = 1:2:population_size - 1
        if rand() < probability
            first = population(cross_pairing(i));
            second = population(cross_pairing(i + 1));
            [population(cross_pairing(i)), population(cross_pairing(i + 1))]...
                = cross_over(first, second);
        end
    end

    out_population = population;
end

