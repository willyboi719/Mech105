function I = Simpson(x,y)


% Error check that the inputs are the same length
if length(x) ~= length(y)
    error('Inputs must be the same length')

    
end
if ~(all(diff(x) == diff(x(1:2)))) % check for equally spaced x
    error('x input must be equally spaced')
end
n = length(x);


if mod(n-1,2) == 0
    % Simpson's 1/3 rule for even number of intervals
    h = x(2) - x(1);
    I = (h/3) * (y(1) + 4*sum(y(2:2:n-1)) + 2*sum(y(3:2:n-2)) + y(n));
else
    % Trapezoidal rule for last interval if odd number of intervals
    warning('Warning: odd number of intervals, using trapezoidal rule for last interval.');
    h = x(2) - x(1);
    I = (h/3) * (y(1) + 4*sum(y(2:2:n-2)) + 2*sum(y(3:2:n-3)) + y(n-1)) + (h/2) * (y(n-1) + y(n));
end

end
