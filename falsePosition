function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method

if nargin > 6
    error
end
if nargin <6
    if nargin == 3
        es = .000001;
        maxit = 200;
    end
    es = .000001;
end
ea = 1;
iter = 0;
root = 1; %initial guess


while true
    rootprev = root;
    root = xu - (((func(xu)) *(xl - xu)) / ((func(xl)) - (func(xu))) );  %False Position Formula
    ea = 100*abs((root-rootprev)/root);          %Approx error
    
 if func(xu) > 0 && func(root) > 0 || func(xu) < 0 && func(root) < 0     %check to switch xl or xu
    
     xu = root;
 else 
     xl = root;
     
     
 end
 iter = iter+1;

     
 if ea <= es || iter == maxit            %checks for error or for max iter
     break
 end

end


    fx = func(root)
    es
    ea

end

