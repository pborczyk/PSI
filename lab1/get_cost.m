function [ cost ] = get_cost( node1, node2 )

x1 = node1(2);
y1 = node1(3);

x2 = node2(2);
y2 = node2(3);

cost = sqrt((x1-x2)^2+(y1-y2)^2);

end

