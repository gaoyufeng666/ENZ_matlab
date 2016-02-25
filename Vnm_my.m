function [ output ] = Vnm_my( n ,f,r)
%UNTITLED Summary of this function goes here
%   返回参数为n，变量f和r的计算值;m=0;
%epsilon = exp((m-abs(m))/2);     
%p=(n-abs(m))/2;
%q=(n+abs(m))/2;
q=n/2;
p=q;
fir_sum =zeros(size(f,1),size(f,2));
aa=0;
out_count=0;
for k=0:100 %原求和是0到正无穷现在求前100项足够近似
    sum_in = zeros(size(r,1),size(r,2));
    for l=max([0,k-q,p-k]):k+p
        j=(k+p-l)/2;
        if 0==rem(j,1)
            w_kl=(2*k+2*p-4*j+1)/(2*k+2*p-2*j+1)*(nchoosek(2*(k-j),k-j)*nchoosek(2*(j),j)*nchoosek(2*(p-j),p-j)/nchoosek(2*(k+p-j),k+p-j));
        else
            w_kl=0;
        end
        sum_in = sum_in +(-1)^l*w_kl*besselj(2*l+1,2*pi*r)./(2*pi*r);
    end
    fir_sum = fir_sum + ((2*k+1)*(1i)^k*sqrt(pi./f).*besselj(k+0.5,0.5*f)).*sum_in;
    %--------------------------------------
    bb=abs(sum(sum(fir_sum)));
    if (bb-aa)/bb<0.01
        out_count=out_count+1;
    else
        out_count=0;
    end
    if out_count==3
        break;
    end
    aa=bb;
    %------------------------------------------
end

output = exp(0.5*1i*f).*fir_sum;

end

