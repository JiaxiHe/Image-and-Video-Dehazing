% Jiaxi He
% Swinburne University of Technology
% jiaxihe@swin.edu.au

function [cA2, cH2,cV2,cD2, cH1, cV1, cD1]=wtdec3_twolevel(Input)


[c,s]=wavedec2(Input, 2, 'haar');
cA2 =appcoef2(c,s,'haar',2);
 
[cH2,cV2,cD2]=detcoef2('all',c,s,2);
[cH1,cV1,cD1]=detcoef2('all',c,s,1);

% a1=wrcoef2('a',c,s,'haar',1);
% h1=wrcoef2('h',c,s,'haar',1);
% v1=wrcoef2('v',c,s,'haar',1);
% d1=wrcoef2('d',c,s,'haar',1);
% c1=[a1,h1;v1,d1];
% c=[cA1, cH1; cV1, cD1];




% reconstructed = idwt2(cA1, cH1, cV1, cD1, 'haar');

