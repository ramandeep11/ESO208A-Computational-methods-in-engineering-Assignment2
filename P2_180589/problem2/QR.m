function QR(n,A,e)
  
  function [q,r] = solveQR(A)
    q(1:n,1)=A(:,1)/(norm(A(:,1),2));
    for k=1:n-1
      sum=0;
      for iterations=1:k
        sum=sum+(((A(:,k+1))')*(q(:,iterations)))*q(:,iterations);
      end
      z=A(:,k+1) - sum;
      q(1:n,k+1)=z/(norm(z,2));
    end
    
    for i=1:n
      for j=1:n
        if i>j
          r(i,j)=0;
        else
          r(i,j)=((q(:,i))')*(A(:,j));
        end
      end
    end
  end


I=[];
Q=[];
R=[];
iterations_check=true;
iterations_number=0;

% first iterations
iterations_number=1;
[Q,R]=solveQR(A);
for i=1:n
  I(i,iterations_number)=R(i,i);
end

while iterations_check
  error=0;
  iterations_number=iterations_number + 1;
  A=R*Q;
  [Q,R]=solveQR(A);
  for i=1:n
    I(i,iterations_number)=R(i,i);
    if abs((I(i,iterations_number)-I(i,iterations_number-1))/I(i,iterations_number-1))*100>error
      error=abs((I(i,iterations_number)-I(i,iterations_number-1))/I(i,iterations_number-1))*100;
    end
  end
  if error < e
    iterations_check=false;
  end
end

disp(I(:,iterations_number));

fid=fopen('output.txt','a');
fprintf(fid,'QR Method\n\n');
fprintf(fid,'Eigen values=\n');
fprintf(fid, '\n%f \n',I(1:n,iterations_number));
fprintf(fid,'\nItertions=%d\n\n',iterations_number);

fclose(fid);
end