clearvars
number_of_cities = 5;
cities = zeros(number_of_cities,3);
for i = 1 : number_of_cities
    cities(i,:) = [i,  rand() * 10,  rand() * 10];
end

state.path = [0];
state.cost = [0];
state.heuristic = [0];

result = offspring(state(1), cities);

stack.data = state;
stack.pointer = 1;

done.data = state;
done.pointer = 1;

for i=1 : number_of_cities
    stack.data(stack.pointer) = result(i);
    stack.pointer = stack.pointer + 1;
end

while stack.pointer > 1
    if length (stack.data(stack.pointer - 1).path) < number_of_cities
       temp_res = offspring(stack.data(stack.pointer - 1), cities);
        stack.pointer = stack.pointer - 1;
       for i=1 : length(temp_res)
           stack.data(stack.pointer) = temp_res(i);
           stack.pointer = stack.pointer + 1;
       end
       
      
    else
        done.data(done.pointer) = stack.data(stack.pointer - 1);
        done.pointer = done.pointer + 1;
        stack.pointer = stack.pointer - 1;
    end
end