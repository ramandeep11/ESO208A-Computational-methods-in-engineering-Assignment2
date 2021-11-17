function sol = ThomasAlgorithm()
filename = input('Enter the text filename(without extension): ', 's');%just fileneme please no extension filename for input
filename=strcat(filename,'.txt');
fid = fopen(filename);
tline = fgetl(fid);
n = str2num(tline);%size of matrix
%tline = fgetl(fid);
t = [];
temp = [];
l=[];
d=[];
u=[];
x=[];
alpha=[];
beta=[];
for i = 1:n
    tline = fgetl(fid);
    temp=str2num(tline);
    for j=1:n
    t(i,j) = temp(1,j);
    end
    b(i,1) = temp(1,n+1);
    %t(i,1:n) = str2num(tline);
    
end
fclose(fid);
%reshape of t and b vectors in the required dimension
t = reshape(t,n,n);
b = reshape(b,n,1);
%disp(t)
%disp(b)
d(1,1) = t(1,1);%store t(1,1) in d
l(1,1)=0;
u(n,1)=0;
for j = 2:n %create l,d&u
    d(j,1) = t(j,j);
    l(j,1) = t(j,j-1);
    u(j-1,1) = t(j-1,j);
end
d = reshape(d,n,1);
l = reshape(l,n,1);
u = reshape(u,n,1);
for i = 1:n
    if i ==1
        %initialize vector alpha & beta
        alpha(i,1) = d(1,1);
        beta(i,1) = b(1,1);
    else
        %other iterations of alpha & beta
        alpha(i,1) = d(i,1) - (l(i,1)/alpha(i-1,1))*u(i-1,1);
        beta(i,1) = b(i,1) - (l(i,1)/alpha(i-1,1))*beta(i-1,1);
    end
end
%disp(alpha)
%disp(beta)
for i = n:-1:1 %loop for calculating the vector x which is the solution
    if i == n
        x(i,1) = beta(n,1)/alpha(n,1);
    else
        x(i,1) = (beta(i,1)-(u(i,1)*x(i+1,1)))/alpha(i,1);
    end
end

fid = fopen('output.txt','a');%output shown in output folder.
fprintf(fid,'Thomas algo.\n');
fprintf(fid, '%f \n',x);
fprintf(fid,'\n');
fclose(fid);
x %display of vector x
end