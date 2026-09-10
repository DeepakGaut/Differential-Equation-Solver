function Homo2ndOrder(eqn)
%The function takes in a string eqn of the form ay'' + by' + cy = 0 and
%outputs the solution. Note that the solution must be real.
    eqn(eqn==' ') = '';
    
    [second rest] = strtok(eqn,'''');
    a = str2num(second(1:end-1));
    [first rest] = strtok(rest, '''');
    b = str2num(first(2:end-1));
    [zeroth rest] = strtok(rest, '''');
    c = str2num(zeroth(2:end-3));
    %tokenizes each string into their coefficients a, b, and c, and
    %converts them from strings into numbers that calculations can be done
    %upon.
    if isempty(a)
        a = 1;
    end
    if isempty(b)
        b = 1;
    end
    if isempty(c)
        c = 1;
    end
    %The three above conditionals check to see if the user put a '1' where
    %the coefficient was. if they didn't, the respective string would be
    %empty, which is why a 1 is replaced. It is convention to not put a 1
    %as a coefficient (e.g. x instead of 1x).
    
    
    [plus minus] = quad(a,b,c);
    %Uses quad to solve the quadratic equation ax^2+bx+c=0.
    if (isreal(plus) && isreal(minus))
        sprintf('The solution to the equation %s is\ny = Ae^(%dt) + Be^(%dt), where A and B are constants.', eqn, plus, minus)
    else
        sprintf('The solution is has a complex value. Cannot compute.')
    end
end