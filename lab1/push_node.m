function [state] = push_node( nodes, state )
    number_of_nodes_to_add = size(nodes, 2);
    state.nodes_to_check = [state.nodes_to_check(1:state.nodes_to_check_ptr), nodes];
    state.nodes_to_check_ptr = state.nodes_to_check_ptr + number_of_nodes_to_add;
end

