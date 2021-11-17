function PowerMethod(n,A,e)

z = rand(n,1)
Y=[];
iterations_check=true;
iterations=0;

iterations=1;
y=z/(norm(z,2));
z=A*y;
Y(1:n,iterations)=y;

% iterations
while iterations_check
  iterations=iterations+1;
  y=z/(norm(z,2));
  z=A*y;
  disp(z);%just to write the eigenvector in pdf solutions
  Y(1:n,iterations)=y;
  error=abs( (Y(1:n,iterations)-Y(1:n,iterations-1))/Y(1:n,iterations) )*100;
  if norm(error,inf)*100 < e
    iterations_check=false;
  end
end

I=(y')*(z);
disp(I);

fid=fopen('output.txt','a');
fprintf(fid,'Power Method\n');
fprintf(fid,'Eigen value=%f\n', I);
fprintf(fid,'iterations=%d\n\n',iterations);
V=[];
d=[];
[V,d] = eig(A);

for p=1:n
fprintf(fid,'Eigen vectors');
fprintf(fid,'%f  ',V(1:n,p));
fprintf(fid,'\n');
end
fclose(fid);

end