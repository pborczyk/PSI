function [] = offspring( current_node, cities )

cost_fun =@(city1,city2) sqrt((city1.x - city2.x).^2 + (city1.y - city2.y).^2);

visited_cities = current_node.path;

for i=1:size(cities,2)
    all_cities(i) = cities(i).number;
end

unvisited_cities = setdiff(all_cities, visited_cities);

for i=1:size(unvisited_cities, 1)
    child.path = [current_node.path, unvisited_cities(i)];
    
    city_before = cities(child.path(end-1));
    current_city = cities(child.path(end));
    child.cost = child.cost + cost_fun(city_before, current_city);
    push_node(child);
   
end

