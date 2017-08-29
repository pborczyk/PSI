function [] = push_node( node, state )
    state.nodes_to_check_ptr = state.nodes_to_check_ptr + 1;
    state.nodes_to_check(state.nodes_to_check_ptr) = node;
end

