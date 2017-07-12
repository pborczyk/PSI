clearvars
% e = y - T(n)
% delta w = e * [x1 x2]
% wb = wb + e
weight_function = @(w1,w2,wb,x,y) signum([w1, w2] * [x; y] + 1 * wb);

%another set of points
%PositivePoints = horzcat ([-5; 1] ,[-6; -2], [0; -5], [3; -7], [4.5; 1.3]); 
%NegativePoints = horzcat ([-18; -0.76], [-12; -12], [-19; -10.5], [-17; -10.5], [-10; -10]);

PositivePoints = horzcat ([-8; 20] ,[-9; -10], [-6; -5], [2; 20], [4; 25]); 
NegativePoints = horzcat ([-6; -25], [-2; -10], [1; -10], [4; -16], [5; 9]);
Points = horzcat (PositivePoints, NegativePoints);
Teacher = horzcat (ones(1, 5), zeros(1, 5));

w(1) = 0.5;
w(2) = 0.7;
wb = 0.3;

is_completed = false;

while ~is_completed
    for i = 1 :  length(Points)
       result = weight_function(w(1),w(2),wb,Points(1,i), Points(2,i));
       if result ~= Teacher(i)
           error =  Teacher(i) - result;
           wb = wb + error;
           delta_w = error * [Points(1,i), Points(2,i)];
           w = w + delta_w;
           break;
       end
       
       if i == length(Points)
          is_completed = true; 
       end
    end
end


% wzór na prost¹ do sprawdzenia
line_x = -10:0.001:10;
line_y = (-w(1) * line_x - wb)/ -w(2)* (-1);

plot(Points(1,1:length(PositivePoints)),Points(2,1:length(PositivePoints)),'r+' ...
,Points(1,length(PositivePoints) + 1:length(Points)),Points(2,length(PositivePoints) + 1:length(Points)),'b*', ...
line_x,line_y)

title('Wyniki nauki')

while true
    x_to_check = input('Wpisz x: ');
    y_to_check = input('Wpisz y: ');
    
    check_result = weight_function(w(1),w(2),wb,x_to_check, y_to_check);
    
    if check_result == 1
        disp('Punkt pozytywny');
    else
        disp('Punkt negatywny');
    end
    
    exit_question_result = input('Zakoñczyæ?[t/n]: ','s');
    switch exit_question_result
        case 't',
           break;
        case 'n',  
    end
end


