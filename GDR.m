function omegas = GDR(X,T,omega,K,R,epsilonS)

[D, N] = size(X);
%initial omegas before looping,this is used for the judgement in the while
%loop
epsilonL = 1e-3;
epsilonG = 1e-3;
minrate = 1e-10;
maxrate = 1e1;
outflag = 1;
while outflag
   %initial parameters
   omegas=omega; 
   %when the gradient is large or small enough or r is large
   inflag = 1;
   while inflag
       r=maxrate;
       omega=omegas-r*deltaL(X,T,K,omegas);
       while (r>=minrate)&&((L(X,T,K,omegas)-L(X,T,K,omega))<epsilonL)
           r=0.1*r;
           omega=omegas-r*deltaL(X,T,K,omegas);
       end
       if r>=minrate
          omegas=omega;
       end
       
       if (max(abs(deltaL(X,T,K,omegas)))<epsilonG) || (r<minrate)
           inflag = 0;
       end
   end
   %for each omega(i) of omega[]

   flag=0;
   for i=1:N
       for j=-R:epsilonS:R
           omega=omegas;
           omega(i)=omega(i)+j;
           if L(X,T,K,omegas)-L(X,T,K,omega)>=epsilonL
               flag=1;
               break
           end
       end
       if flag==1
           break
       end
   end
  
   
   if L(X,T,K,omegas)-L(X,T,K,omega)<epsilonL
       outflag = 0;
   end
end

end