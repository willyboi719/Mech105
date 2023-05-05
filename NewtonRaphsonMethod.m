

old = 3.2;               %Initial Guess
eaf = .1; %Desired approx error
syms x
g(x) =  tanh(x^2-9); %function that you are evaluating
gprime(x) = diff(g);

ea = 1;
p = 0;

while p < 3      %Number of iterations times
   
    new = old - (g(old)) / (gprime(old));
  % ea = abs(x0 - root);
   old = vpa(new)
p = p+1;
end
root = old
