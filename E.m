function error=E(x,t,omega)
%this function is used to calculate error
[D, N] = size(x);
misclass=0;
tempt=0;
for i=1:D
    F=omega*x(i,:)';
    if F>=0
        tempt=1;
    end
    if F<0
        tempt=-1;
    end
    if tempt==-t(i)
        misclass=misclass+1;
    end
end
error=misclass/D;
end