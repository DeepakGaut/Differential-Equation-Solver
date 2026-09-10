function ODEsolver
q1 = input('Do you wish to solve a differential equation? (Answer with Y for yes and N for no): ','s');
q1 = upper(q1);

if (q1=='N')
    disp('Thanks for using the Ordinary Differential Equation Solver.');
    
elseif (q1=='Y')
    disp('What kind of differential equation do you wish to solve?');
    disp('1. First Order Homogeneous Differential Equations');
    disp('2. Second Order Homogeneous Differential Equations');
    
    q2 = input('Please select your choice by typing in a number. ');
    
    if (q2==1)
        q3a = input('Please enter the 1st order differential equation you wish to solve: ','s');
        Homo1stOrder(q3a)
    end
    
    if (q2==2)
        q3b = input('Please enter the 2nd order differential equation you wish to solve: ','s');
        Homo2ndOrder(q3b)
    end
    
else
    disp('Invalid response. Please restart the program.');
end

end