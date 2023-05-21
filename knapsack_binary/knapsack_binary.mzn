%in this model we dont use quantity restrictions here we use binary desicion variables
int:n;
array[1..n] of int: w;% % respective weights of items
array[1..n] of int: v;%  % values of all items
int: W; % knapsack maximum capacity

array[1..n] of var 0..1: x; % here we use binary desicion variable which shows if our item was selected or not

constraint sum([w[i] * x[i] | i in 1..n]) <= W;

var int: total_value = sum([v[i] * x[i] | i in 1..n]); 

solve maximize total_value; 

include "binary_knapsack.dzn";

output [
    "total: " ++ show(total_value) ++"\n"
    ++ show([i| i in 1..n  where x[i] == 1]) ++"\n"
];
