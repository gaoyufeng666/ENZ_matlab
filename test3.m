%模拟平行于光轴截面的光场
clc;clear all;
load 'table1.mat';
f =linspace(-20,20,200);%f的取值范围和采样点数
eps=0.01;    % a small offset epsilon, to avoid deviding by zero
f=f+eps;
r =linspace(-5,5,100);  %r的取值范围和采样点数
r=r+eps;
[F,R]=meshgrid(f,r);
rout2=zeros(size(F,1),size(F,2));

%r在for循环中逐一输入Vnm，f作为向量直接输入到Vnm中

    
    for ii=1:7 %这个for循环用来计算14个模式的和
        disp(ii);
        rout2 = rout2 + table1(2,ii)*Vnm_my(table1(1,ii),F,R);
        %tabel1(2,3,4   )分别代表三个不同的模式
    end
    
o=rout2.*conj(rout2);
intensity = o/max(o(:));
figure;
 pcolor(f,r,intensity);shading interp;
