clc
clearvars
fitness_function = @(x) 2*(x^2 + 1);

population_size = 25;
crossing_probability = 1;
mutation_probability = 0.01;

population(1,1).genotype = [];
population(1,1).fitness = [];
population(1,1).selection_probability = [];

for i = 1 : population_size
    population(1,i).genotype = dec2bin(rand() * 127, 7);
end

number_of_turns = 20;

disp('\n initial population \n')

avg = 0;
for j = 1 : population_size
    fprintf('%s - %d \n', population(1, j).genotype, bin2dec(population(1,j).genotype))
    avg = avg + bin2dec(population(1,j).genotype);
end
fprintf('Œrednia to: %f', avg / population_size);


for i = 1 : number_of_turns
    
    
    for j = 1 : population_size
        fenotype = bin2dec(population(i, j).genotype);
        population(i, j).fitness = fitness_function(fenotype);
    end
    fitness_sum = sum(cat(1, population(1,:).fitness));
    
    for j = 1 : population_size
        population(i, j).selection_probability = (population(i, j).fitness / fitness_sum) * 100;
    end
    

    for j = 1 : population_size
        roulette_pointer = rand() * 100;
        k = 0;
        while roulette_pointer > 0
            k = k + 1;
               if k ==  population_size + 1
                k = 1;
            end
            roulette_pointer = roulette_pointer - population(i, k).selection_probability;
        end
        population(i + 1, j) = population(i, k); 
    end
    
    population(i + 1, :) = make_love(population(i + 1, :), crossing_probability);
    population(i + 1, :) = mutate(population(i + 1, :), mutation_probability);
    
    fprintf('population # %d \n', i) 

    avg = 0;
    for j = 1 : population_size
        fprintf('%s - %d \n', population(i + 1, j).genotype,bin2dec(population(i + 1,j).genotype)) 
        avg = avg + bin2dec(population(i + 1,j).genotype);
    end
    fprintf('Œrednia to: %f \n', avg / population_size);
end

 for i = 1 : population_size
        result_array(i) = bin2dec(population(number_of_turns + 1, i).genotype);
 end
 fprintf('Najlepszy chromosom to: %f \n', max(result_array));