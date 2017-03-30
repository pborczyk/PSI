function [ result ] = offspring( current_node, cities )

number_of_cities = size(cities,1);
working_cities = [cities, zeros(number_of_cities,1)];

for i = 1 : number_of_cities
    for path_iterator = 1 : size(current_node.path,1)
        if working_cities(i,1) == current_node.path(path_iterator)
            working_cities(i,4) = 1;
        end
    end
end

unvisited_cities_iterator = 1;
for i = 1 : number_of_cities
   if working_cities(i,4) == 0
      unvisited_cities(unvisited_cities_iterator) = working_cities(i,1);
      unvisited_cities_iterator = unvisited_cities_iterator + 1;
   end
end


j=1;
for i = 1 : number_of_cities
    if working_cities(i,4) == 0
       current_path_size = size(current_node.path,1);
       result(j) = current_node;
       result(j).path(current_path_size) = unvisited_cities(j);
       if current_path_size > 1
            result(j).cost = result(j).cost + get_cost(cities(result(j).path(current_path_size),1) ,cities(result(j).path(current_path_size + 1),1));
       end
       j=j+1;
    end
end

end

