clearvars
fitness_function = @(x) 2*(x^2 + 1);

population_size = 10;
crossing_probability = 0.65;
mutation_probability = 0.25;

population(1,1).genotype = [];
population(1,1).fitness = [];
population(1,1).selection_probability = [];

for i = 1 : population_size
    population(1,i).genotype = dec2bin(rand() * 127, 7);
end

number_of_turns = population_size;

for i = 1 : number_of_turns
    
    
    for j = 1 : population_size
        fenotype = bin2dec(population(i, j).genotype);
        population(i, j).fitness = fitness_function(fenotype);
    end
    fitness_sum = sum(cat(1, population(1,:).fitness));
    
    for j = 1 : population_size
        population(i, j).selection_probability = (population(i, j).fitness / fitness_sum) * 100;
    end
    
    roulette_pointer = rand() * 100;
    
  
    for j = 1 : population_size
        k = 1;
        while roulette_pointer > 0
            roulette_pointer = roulette_pointer - population(i, k).selection_probability;
            k = k + 1;
            if k ==  population_size + 1
                k = 1;
            end
        end
        population(i + 1, j) = population(i, k); 
    end
    
    population(i + 1, :) = make_love(population(i + 1, :), crossing_probability);
    population(i + 1, :) = mutate(population(i + 1, :), crossing_probability);
end

for j = 1 : population_size
   disp(population(i + 1, j).genotype) 
end