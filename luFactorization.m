function [L, U, P] = luFactor(A)
if size(A,1) ~= size(A,2)
    error()
end
n = size(A,1);
L = eye(n);
U = A;
P = eye(n);
for k = 1:n-1
    % Partial pivoting
    [max_val, max_index] = max(abs(U(k:n,k)));
    max_index = max_index + k - 1;
    if max_val == 0
        error('Matrix is singular.');
    end
    % Swap rows in U
    U([k max_index],k:n) = U([max_index k],k:n);
    % Swap rows in P
    P([k max_index],:) = P([max_index k],:);
    % Swap rows in L
    if k > 1
        L([k max_index],1:k-1) = L([max_index k],1:k-1);
    end
    % Gaussian elimination
    for i = k+1:n
        L(i,k) = U(i,k)/U(k,k);
        U(i,k:n) = U(i,k:n) - L(i,k)*U(k,k:n);
    end
end
end


