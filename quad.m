function [plus minus] = quad(a,b,c)
%The function takes in the coefficients to the equation ax^2+bx+c=0 and
%finds the roots of x.
    plus = (-b + sqrt(b.^2 - 4.*a.*c)) ./ (2 * a);
    minus = (-b - sqrt(b.^2 - 4.*a.*c)) ./ (2 * a);
end