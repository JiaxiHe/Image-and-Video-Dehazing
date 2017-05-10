% Jiaxi He
% Swinburne University of Technology
% jiaxihe@swin.edu.au

function d = Dx3(u)
[rows,cols,dims] = size(u); 
d = zeros(rows,cols,dims);
d(:,2:cols,:) = u(:,2:cols,:)-u(:,1:cols-1,:);
d(:,1,:) = u(:,1,:)-u(:,cols,:);
return