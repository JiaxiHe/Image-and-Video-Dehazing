% Jiaxi He
% Swinburne University of Technology
% jiaxihe@swin.edu.au

function d = Dyt3(u)
[rows,cols,dims] = size(u); 
d = zeros(rows,cols,dims);
d(1:rows-1,:,:) = u(1:rows-1,:,:)-u(2:rows,:,:);
d(rows,:,:) = u(rows,:,:)-u(1,:,:);
return