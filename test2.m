clc;clear all;
%ģ�ⴹֱ�ڹ�������ϵĳ��ֲ� 
load 'table1.mat';
r =linspace(-5,5,100);  %r��ȡֵ��Χ�Ͳ�������
rout2=0;
    for ii=1:size(table1,2) %���forѭ����������14��ģʽ�ĺ�
        
        rout2 = rout2 +table1(3,ii)*Vnm(table1(1,ii),1,r);
        %tabel1(2,3,4   )�ֱ����������ͬ��ģʽ
    end

figure;
plot(abs(rout2));
