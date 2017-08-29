%config
number_of_cities = 4;
start_city = 1;
dest_city = 4;

%consts
boundry = 10;

for i = 1: number_of_cities
    cities(i).number = i;
    cities(i).x = rand() * boundry;
    cities(i).y = rand() * boundry;
end

%preparing initial state
state.nodes(1).path(1) = start_city;
state.nodes(1).cost = 0;
state.nodes_to_check_ptr = 1;

state.nodes_to_check = state.nodes; %is a fokin stack

while size(state.nodes_to_check_ptr == 0)
     new_nodes = offspring(pop_node(state), cities);
     if size(new_nodes(1).path) ~= number_of_cities
        push_node(new_nodes, state);
     end
 end
