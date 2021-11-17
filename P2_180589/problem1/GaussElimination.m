function sol = GaussElimination()
filename = input('Enter the text filename(without .txt): ', 's');
fid = fopen(strcat(filename,'.txt'));
tline = fgetl(fid);
n = str2num(tline);

A = [];
temp =[];
b=[];
x=[];
for i = 1:n
    tline = fgetl(fid);
    temp=str2num(tline);
    for j=1:n
    A(i,j) = temp(1,j);
    end
    b(i,1) = temp(1,n+1);
    
end

fclose(fid);

%this loop for partial pivoting 
for i =1:n
    max = A(i,i); %initialize the max variable
    k = i;          %initialize the var k
    for j = i:n-1   %this loop for interchanging the rows
        if max<A(j+1,i)
            k = j+1;
        end
        if j == n-1
            A([i,k],:)= A([k,i],:); %code for interchanging the rows
            b([i,k],:) = b([k,i],:);
        end
     
    end
    
end

%disp(b)
%this loop applied row operations on mat to get upper triangular matrix 
for k = 1:n
    for i = k+1:n
        l = A(i,k)/A(k,k);
        b(i,1) = b(i,1) - l*b(k,1);
        for j = 1:n 
            A(i,j) = A(i,j) - l*A(k,j); 
        end
    end
end
 A=reshape(A,n,n);
            fid=fopen('output.txt','a');
            fprintf(fid,'A matrix after gauss elimination\n');
            fprintf(fid,'%f \n',A);
            fclose(fid);
            A%here we get the required upper triangular matrix
%disp(b)
%this loop finds the solution vector
for i = n:-1:1
    sum = 0;
    if i == n
        x(i,1) = b(i,1)/A(i,i);
    else
        for j = i+1:n
            sum = sum + A(i,j)*x(j,1);
        end
        x(i,1) = (b(i,1) - sum)/A(i,i);
    end
end
%x = reshape(x,n,1);
x
fid = fopen('output.txt','a');
fprintf(fid,'Gausss Elimination solutions\n');
fprintf(fid, '%f \n',x);
fclose(fid);

end