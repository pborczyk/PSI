function [ element ] = pop_node( state )
    element = state.nodes_to_check(state.nodes_to_check_ptr);
    state.nodes_to_check_ptr = state.nodes_to_check_ptr - 1;
end

