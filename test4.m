%ģ��ƽ���ڹ������Ĺⳡ
clc;clear all;
load 'table1.mat';
f =linspace(-100,100,200);%f��ȡֵ��Χ�Ͳ�������
r =linspace(-20,20,100);  %r��ȡֵ��Χ�Ͳ�������
[R,F]=meshgrid(r,f);
rout2=zeros(size(F,1),size(F,2));
    for ii=1:8 %���forѭ����������14��ģʽ�ĺ�
    disp(ii);    
        rout2 = rout2 + table1(3,ii)*Vnm(R,F,table1(1,ii),0);
        %tabel1(2,3,4   )�ֱ����������ͬ��ģʽ
    end

figure;
imagesc(abs(rout2.'));colorbar;axis off;
o=abs(rout2.');