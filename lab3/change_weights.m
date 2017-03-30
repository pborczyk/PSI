function [ w1, w2, wb ] = change_weights( w1,w2,wb,result,expected )
error = result - expected;
delta_w = error * []
wb = wb + error;

end

