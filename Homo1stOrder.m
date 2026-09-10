function Homo1stOrder(eqn)

    eqn(eqn == ' ') = '';
    [first rest] = strtok(eqn, '''');
    first
    if first(1) == 'y' || isempty(first)
        a = 1;
    else
        a = str2num(first(1:end-1));
    end
    [zeroth rest] = strtok(rest, '''');
    b = str2num(zeroth(2:end-3));
    
    if isempty(b)
        b = 1;
    end
    
   c = -b/a;
   
   sprintf('The solution to %s is Ae^((%d)t), where A is some constant.', eqn,c)