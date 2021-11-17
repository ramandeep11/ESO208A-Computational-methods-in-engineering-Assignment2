function sol = CholeskyMethod()
filename = input('Enter the text filenme: ', 's');
fid = fopen(strcat(filename,'.txt'));
tline = fgetl(fid);%to take a line as a input removing the newline character
n = str2num(tline);%size of matrix
%tline = fgetl(fid);
A = [];%shows initializing
temp = [];
b=[];
x=[];
p=[];
for i = 1:n
    tline = fgetl(fid);
    temp=str2num(tline)
    for j=1:n
    A(i,j) = temp(1,j);
    end
    b(i,1) = temp(1,n+1);
end
fclose(fid);
fid = fopen('output.txt','a');
fprintf(fid,'Cholskey algo.\n\n');
fclose(fid);
    A = reshape(A,n,n);
    b = reshape(b,n,1);
    

cnt = 0;
    for k = 1:n
        max = A(k,k);
        x=k;y=k;
        for i = k:n
            for j = k:n
                if A(i,j)>max
                    max = A(i,j);
                    x=i;y=j;
                    
                end
                
            end 
        end
        if x ~= k
            fid = fopen('output.txt','a');
            fprintf(fid,'row%d<-->Row%d\n',k,x);
            fclose(fid);
            A([x,k],:)= A([k,x],:);
            b([x,k],:)= b([k,x],:);
            cnt = cnt + 1;
            A=reshape(A,n,n);
          
            disp(A)
        end
        
        if y ~= k
             fid = fopen('output.txt','a');
            fprintf(fid,'column%d<-->column%d\n',k,y);
            fclose(fid);
            A(:,[y,k])= A(:,[k,y]);
            cnt = cnt + 1;
            %disp(A)
            A=reshape(A,n,n);
           
            
            disp(A)
        end
        
    end
    
    %disp(A)
    p = cnt;
l = zeros(n);

for j = 1:n
    sum1 = 0;
    sum2 = 0;
    for i = 1:n
        if j == 1
            if i == j
                l(j,j) = (A(j,j))^(1/2);
            end
            if i>j
                l(i,j) = A(i,j)/l(j,j);
            end
        else
            for k = 1:j-1
            
            if i == j
                sum1 = sum1 + l(j,k)^2;
                l(j,j) = (A(j,j) - sum1)^(1/2);
                
            end
            if i>j
                sum2 = sum2 + l(i,k)*l(j,k);
                l(i,j) = (A(i,j) - sum2)/l(j,j);
                
            end
            
            %disp(l)
            end
        end
      %in this i have shown L in output.txt , rows and column exchanged are shown in command window.  
        
    end
end
l = reshape(l,n,n);
fid = fopen('output.txt','a');
fprintf(fid,'total no. of all the row and columns exchanges performed: ');
fprintf(fid,'%f\n',p);
fprintf(fid,'\nA=\n');
for i=1:n
    fprintf(fid,'%f ',A(i,:));
    fprintf(fid,'\n');
end
fprintf(fid,'\nL =\n'); 
for i = 1:size(l,1)
    fprintf(fid,'%6.4f \t',l(i,:));
    fprintf(fid,'\n');
end
fprintf(fid,'\n');
fclose(fid);
p
l
end