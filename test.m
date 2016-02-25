clc;clear all;
% SLM上的光场分布
load 'table1.mat';
x =-1:0.01:1;
[X,Y]=meshgrid(x,x);
[theta,r] = cart2pol(X,Y);
r(r>1)=nan;
rout = 0;
h = waitbar(0,'Please wait...');
for ii=1:size(table1,2)
   waitbar(ii/14);
   rout = rout +table1(4,ii)*Czernike(table1(1,ii),r);
end
close(h);
figure;
subplot(1,2,1);
imshow(r,[]);
subplot(1,2,2);
imshow(rout,[]);
%  rout = Czernike(table1(1,10),r);
%  imshow(rout,[]);
