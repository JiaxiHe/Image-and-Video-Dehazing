% Jiaxi He
% Swinburne University of Technology
% jiaxihe@swin.edu.au

function [a] = shrink(x,lambda)

s = sqrt(x.*conj(x));
ss = s-lambda;
ss = ss.*(ss>0);

s = s+(s<lambda);
ss = ss./s;

a = ss.*x;

return