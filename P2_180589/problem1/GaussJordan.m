
function sol = GaussJordan()
filename = input('Enter the text filenme: ', 's');
fid = fopen(strcat(filename,'.txt'));
tline = fgetl(fid);
n = str2num(tline);

A = [];
for i = 1:n
    tline = fgetl(fid);
    A(i,1:n) = str2num(tline);
end
fclose(fid);
I = eye(n);

c=[A,I];
k=1;
while k<=n
    j=k;
    temp=c(k,k);
    while j <= 2*n
        c(k,j)=(c(k,j)/temp);
        j=j+1;
    end
    
        i=1;
        while i<=n
            if i~=k
                l=k;
                temp=c(i,k);
                while  l<=2*n
                    c(i,l)=c(i,l)-temp*c(k,l);
                    l=l+1;
                end
                
            end
           i=i+1; 
        
        end
    k=k+1;
end
disp(c)    
fid = fopen('output.txt','a');
fprintf(fid,'Gauss Jordan\n\nA inverse is=\n');

for i = 1:size(I,1)
    fprintf(fid,'%6.4f \t',c(i,n+1:2*n));
    fprintf(fid,'\n');
end
fclose(fid);
end

