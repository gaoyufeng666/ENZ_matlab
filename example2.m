% This example calculates the through-focus intensity point-spread function for a
% lambda=0.20 micron, NA=0.50, optical system. In addition the finite pinhole size
% of 0.25 micron is taken into account. It is assumed that the optical
% system has no aberrations. The maximum intensity is normalized to 1.
%
% the setting are easily changed by modifing the the parameters in this routine.
clear all;clc;
na=0.50;        % the numerical aperture
diam=0.25;      % diameter in microns
lambda=0.200;   % wavelength in microns
eps=0.00001;    % a small offset epsilon, to avoid deviding by zero

radius=diam/2;
% ap « ≤√¥£ø
ap=2*pi*(na/lambda)*radius;
d=1/8*ap^2+1/384*ap^4+1/10240*ap^6; % optimal d.

scale_z=lambda/(2*pi)*1/(1-sqrt(1-na^2)); % scaling factor for defocus

r_list=linspace(-0.5,0.5,100);f_list=linspace(-3.5,3.5,50);
[r,f]=meshgrid((r_list+eps)*2*pi*na/lambda,f_list/scale_z);

f=f+i*d;        % by using a complex defocus parameter, the finite diameter is taken into account.
%---------------
 % aberration free, so only the m=n=0 term in needed.
load 'table1.mat';
field=0;
for ii=1:(size(table1,2)-2)
    disp(ii);
    field=field+table1(2,ii)*Vnm(r,f,table1(1,ii),0);
end

%-------------------
intensity=field.*conj(field);           % intensity is the square of the field.
intensity = intensity/max(intensity(:));% max intensity normalized to 1.

set(gca,'fontsize',14)                  % plotting routine
% [c,h]=contour(r_list,f_list,intensity,[0.025 0.05 0:0.1:1],'-');
%  clabel(c,h);
intensity1=intensity.';
imagesc(abs(intensity1));colorbar;axis off;
title(['Aberration free PSF, diameter = ' num2str(diam) ' [um]'])
xlabel('Radius [um]')
ylabel('Focus [um]')

