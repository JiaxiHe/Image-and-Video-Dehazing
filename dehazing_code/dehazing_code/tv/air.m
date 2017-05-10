% Jiaxi He
% Swinburne University of Technology
% jiaxihe@swin.edu.au

function A=air(I, patch)

% the way to estimate the Airlight, with RGB color channel seperate
[x_dim, y_dim, n_dim]=size(I);
m=ceil(x_dim/patch);
n=ceil(y_dim/patch);
M=zeros(m,n);

% seperate the color channel in a image
Ir=I(:,:,1);
Ig=I(:,:,2);
Ib=I(:,:,3);

% initial
R= zeros(m,n);
G= zeros(m,n);
B= zeros(m,n);
A=zeros(x_dim, y_dim, n_dim);

for i=1:m
    for j=1:n
        R(i,j)=min(min(Ir(1+(i-1)*patch : min(i*patch, x_dim), 1+(j-1)*patch : min(j*patch, y_dim))));
        G(i,j)=min(min(Ig(1+(i-1)*patch : min(i*patch, x_dim), 1+(j-1)*patch : min(j*patch, y_dim))));
        B(i,j)=min(min(Ib(1+(i-1)*patch : min(i*patch, x_dim), 1+(j-1)*patch : min(j*patch, y_dim))));
    end
end

r=max(max(R));
g=max(max(G));
b=max(max(B));
A(:,:,1)=r;
A(:,:,2)=g;
A(:,:,3)=b;
