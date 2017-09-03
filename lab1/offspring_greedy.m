function [ children ] = offspring_greedy( current_node, cities )

cost_fun =@(city1,city2) sqrt((city1.x - city2.x).^2 + (city1.y - city2.y).^2);

visited_cities = current_node.path;

for i=1:size(cities,2)
    all_cities(i) = cities(i).number;
end


if size(current_node.path) < size(cities,2)
unvisited_cities = setdiff(all_cities, visited_cities);

for i=1:size(unvisited_cities, 2)
    children(i).path = [current_node.path, unvisited_cities(i)];
    
    city_before = cities(children(i).path(end-1));
    current_city = cities(children(i).path(end));
    children(i).cost = current_node.cost + cost_fun(city_before, current_city);
    children(i).heuristic = 0;
   
end

sorted_nodes = sort_nodes(children, 'c');
children = sorted_nodes(1);

else
    unvisited_city = current_node.path(1);
    current_node.path = [current_node.path, unvisited_city];
    city_before = cities(current_node.path(end - 1));
    current_city = cities(end);
    current_node.cost = current_node.cost + cost_fun(city_before, current_city);
    children = current_node;
end
