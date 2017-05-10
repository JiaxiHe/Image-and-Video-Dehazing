% Jiaxi He
% Swinburne University of Technology
% jiaxihe@swin.edu.au

% When you use this provided source code, please cite this paper 
% " Convex Optimization for Fast Image Dehazing"
% by Jiaxi He, Cishen Zhang, Ran Yang and Kai Zhu in IEEE ICIP 2016 

clc; close all; clear all;
addpath('tv');

tic
Input=im2double(imread('Images/moebius_input.png'));


[cA2, cH2,cV2,cD2, cH1, cV1, cD1]=wtdec3_twolevel(Input);
mm=max(max(max(cA2)));
I=cA2./mm;
[m,n,l]=size(I);
A=air(I,2);
Y=A-I;

%% initialize
t=ones(m,n,l);
q=I; 

tt=ones(m,n); % the two dimension transmission map
dx=zeros(m,n); dy=zeros(m,n); bx=zeros(m,n); by=zeros(m,n); 

alpha=0.6; %alpha is the aL2
lambda=1; %lambda is the aTV
mu=1; ref=1.2;
gamma=lambda*ref; %gamma=aTV*ref=lambda*ref, aTV is the lambda
tol=1;

%% main loop
while tol>1e-3
%for i=1:10
    tb=t;
    for c=1:3
        t_est(:,:,c)=gamma/(2*alpha+mu+4*gamma)*(SA(t(:,:,c))+gamma *Dxt(dx-bx)+gamma*Dyt(dy-by))+mu/(2*alpha+mu+4*gamma)*(Y(:,:,c)+q(:,:,c))./A(:,:,c);
    end

    t_est = max(min(max(max(t_est,eps),1-I./A),1-eps),-Y./(1-A));
    tt = max(t_est,[],3); 
    t=cat(3, tt, tt, tt);
    q=A.*t-Y;
   
    for c=1:3
    dx=shrink(Dx(t(:,:,c))+bx,1/ref); %1/ref=lambda/gamma
    dy=shrink(Dy(t(:,:,c))+by,1/ref);
    bx=bx+(Dx(t(:,:,c))-dx);
    by=by+(Dy(t(:,:,c))-dy);
    end
    mu=mu*10; 
    tol=(norm(t(:,:,1)-tb(:,:,1), 1)+norm(t(:,:,2)-tb(:,:,2),1)+norm(t(:,:,3)-tb(:,:,3),1));
    %disp(tol);
end

J=max(q./t,0);

sx=size(cH1);
t2=imresize(t, sx(1:2), 'nearest');
re = idwt2(idwt2(mm*J, cH2./t,cV2./t, cD2./t, 'haar',sx), cH1./t2, cV1./t2, cD1./t2, 'haar');
toc

figure, imshow(Input), title('hazy image');% the hazy image
figure, imshow(re), title('clear image');% the reconstructed image

imwrite(re, 'CODHWT2.jpg');