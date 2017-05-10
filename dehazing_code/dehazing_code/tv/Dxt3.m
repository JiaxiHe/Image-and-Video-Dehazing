% Jiaxi He
% Swinburne University of Technology
% jiaxihe@swin.edu.au


function d = Dxt3(u)
[rows,cols,dims] = size(u); 
d = zeros(rows,cols,dims);
d(:,1:cols-1,:) = u(:,1:cols-1,:)-u(:,2:cols,:);
d(:,cols,:) = u(:,cols,:)-u(:,1,:);
return