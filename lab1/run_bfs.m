%config
number_of_cities = 9;
start_city = 1;
dest_city = 4;

%consts
boundry = 10;
offspring =@(current_node, cities) offspring_naive(current_node, cities);

for i = 1: number_of_cities
    cities(i).number = i;
    cities(i).x = rand() * boundry;
    cities(i).y = rand() * boundry;
end

%preparing initial state
state.nodes(1).path(1) = start_city;
state.nodes(1).cost = 0;
state.nodes(1).heuristic = 0;
state.done = [];
state.nodes_to_check = state.nodes; %is a fokin stack

while size(state.nodes_to_check, 2) ~= 0
     node = state.nodes_to_check(end);
     state.nodes_to_check(end) = [];
     
     new_nodes = offspring(node, cities);
     if size(new_nodes(1).path) ~= number_of_cities + 1
         state.nodes_to_check = [new_nodes ,state.nodes_to_check];
     else
         state.done = [state.done, new_nodes];
     end
end