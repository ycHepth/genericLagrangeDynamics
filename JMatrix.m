function J = JMatrix(mass,mass_center,inertia_tensor)
%JMATRIX 
% %   calculate Jacobian matrix at current linkage
% z0 = [0,0,1]';  % z-direction initial positon
% o0 = [0,0,0]';  % origin position in base-coordinate
% 
% % !!! here need obtain the index of current linkage
% Z(:,:,index) = Trans_matrix(1:3,3,index); % z-direction positon in current linkage coor
% o(:,:,index) = Trans_matrix(1:3,4,index); % origin position in current linkage coordinate

% mass_center position import from input, thus here does not need
% calculate mass center (however this work have be done outside)

% from the input data list, the Jacobi matrix calculation should rely on
% mass, mass_center and inertia_matrix
% However,in script <link_2.m>, mass and inertia_matrix did not use when calculating Jacobi matrix

end

