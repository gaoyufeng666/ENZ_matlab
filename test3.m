%ģ��ƽ���ڹ������Ĺⳡ
clc;clear all;
load 'table1.mat';
f =linspace(-20,20,200);%f��ȡֵ��Χ�Ͳ�������
eps=0.01;    % a small offset epsilon, to avoid deviding by zero
f=f+eps;
r =linspace(-5,5,100);  %r��ȡֵ��Χ�Ͳ�������
r=r+eps;
[F,R]=meshgrid(f,r);
rout2=zeros(size(F,1),size(F,2));

%r��forѭ������һ����Vnm��f��Ϊ����ֱ�����뵽Vnm��

    
    for ii=1:7 %���forѭ����������14��ģʽ�ĺ�
        disp(ii);
        rout2 = rout2 + table1(2,ii)*Vnm_my(table1(1,ii),F,R);
        %tabel1(2,3,4   )�ֱ����������ͬ��ģʽ
    end
    
o=rout2.*conj(rout2);
intensity = o/max(o(:));
figure;
 pcolor(f,r,intensity);shading interp;
