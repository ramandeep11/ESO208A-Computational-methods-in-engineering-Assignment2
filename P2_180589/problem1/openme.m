disp('A. Solve a System of Equation');
disp('B. Perform a LU decomposition');
disp('C. Perform a Matrix Inversion');
str = input('Select one of the following method: ','s');

if str == 'A'
    str11 = input('Is the system Tri-diagonal?[Y/N]:','s');
    if str11 == 'Y'
        ThomasAlgorithm()
    elseif str11 == 'N'
        GaussElimination()
    end
elseif str == 'B'
    str12 = input('Is the matrix symmetric and positive definite?[Y/N]:','s');
    if str12 == 'Y'
       CholeskyMethod()%I haven;t written here crout but i have attached crout function also ,u can directly run it form there,it was only needed in pdf solutions 
    elseif str12 == 'N'
       % fprintf('which method will you prefer \n1.Doolittle\n2.Crout');
        str2=input('which method will you prefer \n1.Doolittle\n2.Crout\n');
        if str2==1
        Doolittle()
        else
        crout()
        end
    end
else
    GaussJordan()
end