% Jiaxi He
% Swinburne University of Technology
% jiaxihe@swin.edu.au


function [cA1, cH1, cV1, cD1]=wtdec3(Input)
 %%

% Input = im2double(rgb2gray(imread('Images/wolf.jpg')));
[c,s]=wavedec2(Input, 1, 'haar');
cA1=appcoef2(c,s,'haar',1);
 
cH1=detcoef2('h', c, s, 1);
cV1=detcoef2('v', c, s, 1);
cD1=detcoef2('d', c, s, 1);


% a1=wrcoef2('a',c,s,'haar',1);
% h1=wrcoef2('h',c,s,'haar',1);
% v1=wrcoef2('v',c,s,'haar',1);
% d1=wrcoef2('d',c,s,'haar',1);
% c1=[a1,h1;v1,d1];
% c=[cA1, cH1; cV1, cD1];


% figure
% subplot(3,1,1), imshow(Input);
% subplot(3,1,2), imshow(c1,[]);
% subplot(3,1,3), imshow(c,[]);

% reconstructed = idwt2(cA1, cH1, cV1, cD1, 'haar');





