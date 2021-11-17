filename=input('Enter the name of the text file: ','s');
fid = fopen(strcat(filename,'.txt'));
tline = fgetl(fid);
n=str2num(tline);
%disp(n);
A=[];
%tline = fgetl(fid);
for i=1:n
 tline = fgetl(fid);
 A(i,1:n)=str2num(tline);   
end
%disp(A);
%tline = fgetl(fid);
tline = fgetl(fid);
e=str2num(tline);
%disp(e);
fclose(fid);
%i have taken data2 just for puuting all the examples in this file
disp('Select one of the following');
disp('Largest eigenvalue - L');
disp('All eigenvalues - A');
str21=input('Enter  choice: ','s');

if str21=='L'
    PowerMethod(n,A,e);
  elseif str21=='A'
    QR(n,A,e);
end