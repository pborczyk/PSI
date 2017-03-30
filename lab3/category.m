% e = y - T(n)
% delta w = e * [x1 x2]
% wb = wb + e
weight_function = @(w1,w2,wb,x,y) sign([w1 w2] * [x; y] + 1 * wb);


PositivePoints = horzcat ([-8; 20] ,[-9; -10], [-6; -5], [2; 20], [4; 25]); 
NegativePoints = horzcat ([-6; -25], [-2; -10], [1; -10], [4; -16], [5; 9]);
Points = horzcat (PositivePoints, NegativePoints);
Teacher = horzcat (ones(1, 5), zeros(1, 5));

w1 = rand();
w2 = rand();
wb = rand();

is_completed = false;

while ~is_completed
    for i = 1 :  length(Points)
       result = weight_function(w1,w2,wb,Points(1,i), Points(2,i));
       if result ~= Teacher(i)
           error = result - expected;
           delta_w = error * [Points(1,i), Points(2,i)];
           wb = wb + error;
           w1 = w1 + delta_w;
           w2 = w2 + delta_w;
       end
    end
end