syms x
g = @(x) x^3 + 6*x^2 +11*x -6.1; %function that you are evaluating
x0 = 5.5;               %Initial Guess
eaf = .0001; %Desired approx error


ea = 1;
while ea > eaf
   root = g(x0);
    
   ea = abs(x0 - root);
   x0 = root;

end
root
ea
