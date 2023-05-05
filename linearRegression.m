function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)

if length(x) ~= length(y)
    error()
end
[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder);

    
fX = sortedX;
fY = sortedY;
       
        n = length(x);
        fqi = (n+1)/4; 
        tqi = (3*n+3)/4; %quartile indexes
            if rem(n,2) == 0
            Q1 = median(sortedY(1:(n/2)));
            Q3 = median(sortedY(((n/2)+1):n));
            elseif rem(n,2) == 1
            Q1 = median(sortedY(1:((n/2)-.5)));
            Q3 = median(sortedY(((n/2)+.5):n));
            end
           

        IQR = Q3 - Q1;
  i = 1;      
 while i <= n
      if fY(i) > Q3 + 1.5*IQR || fY(i) < Q1 - 1.5*IQR
          fY(i) = [];
          fX(i) = [];
          if i == n
              n = n-1;
              break
          end
          n = n-1;
          
      end
      i = i+1;
 end



ymean = mean(fY);
xmean = mean(fX);
a1 = ((n*sum(fX.*fY)) - ((sum(fX))*(sum(fY)))) / ((n*(sum(fX.^2))) - ((sum(fX))^2));
a0 = ymean - a1*xmean;

St = sum((fY - ymean).^2);
Sr = sum((fY - a0 - a1*fX).^2);
Rsquared = 1 - (Sr/St)

slope = a1
intercept = a0
end
