function sol = crout()
filename = input('Enter the text filenme: ', 's');
fid = fopen(strcat(filename,'.txt'));
tline = fgetl(fid);
n = str2num(tline);

A = [];
temp = [];
for i = 1:n
    tline = fgetl(fid);
    temp=str2num(tline);
    for j=1:n
    A(i,j) = temp(1,j);
    end
    b(i,1) = temp(1,n+1);
end

fclose(fid);
fid = fopen('output.txt','a');
fprintf(fid,'Crout Method\n\n');
fclose(fid);
   cnt=0; 
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
            cnt=cnt+1; 
            A=reshape(A,n,n);
            
            
            disp(A)
            
        end
        
        if y ~= k
            fid = fopen('output.txt','a');
            fprintf(fid,'column%d<-->column%d\n',k,y);
            fclose(fid);
            A(:,[y,k])= A(:,[k,y]);
            cnt=cnt+1;
            A=reshape(A,n,n);
            
            disp(A)
            
        end
        
    end
    
    p = cnt;
    u = eye(n);
    l = zeros(n);
    for j = 1:n
        sum1 = 0;
        sum2 = 0;
        for i = 1:n
            if j<i
                if j == 1
                    u(i,j) = A(i,j)/l(1,1);
                else
                    for k = 1:j-1
                        sum1 = sum1 + u(i,k)*l(k,j);
                        u(i,j) = (A(i,j)-sum1)/l(j,j);
                       % disp(u)
                    end
                end
            
                
            end
            if i<=j
                if i == 1
                    l(i,j) = A(i,j);
                else
                     for k = 1:i-1
                        sum2 = sum2 + u(i,k)*l(k,j);
                        l(i,j) = A(i,j) - sum2;
                     %   disp(l)
                     end
                end

            end
        end
    end
fid = fopen('output.txt','a');

fprintf(fid,'total no. of all the row and columns exchanges performed: ');
fprintf(fid,'%f\n',p);
fprintf(fid,'U = \n');
for i = 1:size(l,1)
    
    fprintf(fid,'%6.4f \t',u(i,:));
    fprintf(fid,'\n');
end
fprintf(fid,'\n');
fprintf(fid,'L = \n');
for i = 1:size(l,1)
    
    fprintf(fid,'%6.4f \t',l(i,:));
    fprintf(fid,'\n');
end
fclose(fid);
l
u
end