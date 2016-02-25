% Calculation of the Vnm functions. The output is the electrical field.
% 

function [u_scailar]=Vnm(r,f,n,m)

L_max=35;   % For good convergence, L_max ~ 3 times defocus parameter.
            % for most practical cases L_max=35 is more then sufficient.
u=zeros(size(f));
u_temp=0;
q=1/2*(n+m);p=1/2*(n-m);
for l=1:L_max
u_p=0;   
for j=0:p
   if (p-j)<l
   u_p=u_p+(-1)^p*(m+l+2*j)*nchoosek(m+j+l-1,l-1)*nchoosek(j+l-1,l-1)*nchoosek(l-1,p-j)/nchoosek(q+l+j,l)*besselj(m+l+2*j,r)./(l*r.^l);
   end
end
% u_temp=u_temp+((2*l+1)*(1i)^l*sqrt(pi./f).*besselj(l+0.5,0.5*f)).*u_p;
u_temp=u_temp+(-2*i*(f)).^(l-1).*u_p;
end 
[u_scailar]=2*exp(i*(f)).*u_temp;


 