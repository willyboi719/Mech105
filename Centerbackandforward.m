
syms x

f(x) = x^3-2*x+4;
f1 = diff(f);
f2 = diff(f,2);
h = .25;
val = 1;

diffback = (f(val) - f(val-h)) / h; %backward method
diffford = ((f(val+h)) - (f(val)))/h;      %forward method
diffcent = (((f(val+h)) - (f(val-h)))/(2*h));    %centered method
back(x) = diffback*(x - 1) + 3;
ford(x) = diffford*(x-1) + 3;
cent(x) = diffcent*(x-1) + 3;
fplot(f(x),[-2,2])
title('Different Methods of First Derivative Approximation')
hold on
legend on
xlabel('x')
ylabel('f(x)')
fplot(back(x),[.5,1.5],'r')
hold on
fplot(ford(x),[.5,1.5], 'b')
hold on
fplot(cent(x),[.5,1.5],'g')
legend('f(x)', 'Backward Slope', 'Forward Slope', 'Centered Slope')

% Now for 2nd Deriv
diff2back =((f(val)) - (2*(f(val-h))) +(f(val-(2*h))) )/(h^2); %backward method
diff2ford = (f(val+(2*h)) - (2*(f(val+h))) +(f(val)) )/(h^2);      %forward method
diff2cent = (((f(val+h)) -(2*f(val))+ (f(val-h)))/(h^2));    %centered method
back2(x) = diff2back*(x - 1) + 3;
ford2(x) = diff2ford*(x-1) + 3;
cent2(x) = diff2cent*(x-1) + 3;
figure
fplot(f(x),[-2,2])
title('Different Methods of 2nd Derivative Approximation')
hold on
legend on
xlabel('x')
ylabel('f(x)')
fplot(back2(x),[.5,1.5],'r')
hold on
fplot(ford2(x),[.5,1.5], 'b')
hold on
fplot(cent2(x),[.5,1.5],'g')
legend('f(x)', 'Backward Slope', 'Forward Slope', 'Centered Slope')
