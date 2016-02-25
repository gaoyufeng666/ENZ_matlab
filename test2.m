clc;clear all;
%模拟垂直于光轴截面上的场分布 
load 'table1.mat';
r =linspace(-5,5,100);  %r的取值范围和采样点数
rout2=0;
    for ii=1:size(table1,2) %这个for循环用来计算14个模式的和
        
        rout2 = rout2 +table1(3,ii)*Vnm(table1(1,ii),1,r);
        %tabel1(2,3,4   )分别代表三个不同的模式
    end

figure;
plot(abs(rout2));
