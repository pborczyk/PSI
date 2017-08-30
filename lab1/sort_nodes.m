function [ unsorted ] = sort_nodes( unsorted, criteria )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

switch criteria
    case 'c'
        compare_fun =@(node1, node2) node1.cost - node2.cost;
    case 'h'
        compare_fun =@(node1, node2) node1.heuristic - node2.heuristic;
end

n = size(unsorted);

while n > 0
   j = 0;
    for i = 2:n
        
        if compare_fun(unsorted(i)) > compare_fun(unsorted(i - 1))
            temp = x(i);
            unsorted(i) = x(i - 1);
            unsorted(i - 1) = temp;
            j = i;
        end
    end
    n = j;
end

end

