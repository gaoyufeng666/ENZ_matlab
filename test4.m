%模拟平行于光轴截面的光场
clc;clear all;
load 'table1.mat';
f =linspace(-100,100,200);%f的取值范围和采样点数
r =linspace(-20,20,100);  %r的取值范围和采样点数
[R,F]=meshgrid(r,f);
rout2=zeros(size(F,1),size(F,2));
    for ii=1:8 %这个for循环用来计算14个模式的和
    disp(ii);    
        rout2 = rout2 + table1(3,ii)*Vnm(R,F,table1(1,ii),0);
        %tabel1(2,3,4   )分别代表三个不同的模式
    end

figure;
imagesc(abs(rout2.'));colorbar;axis off;
o=abs(rout2.');