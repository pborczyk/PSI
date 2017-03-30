function [ out_population ] = mutate( population, probability )

population_size = size(population, 2);


for i = 1 : population_size
    if rand() < probability
        locus = randi([1,7]);
        char = population(i).genotype(locus);
        if char == '0'
            char = '1';
        else
            char = '0';
        end
        population(i).genotype(locus) = char;
    end
end

out_population = population;

end

