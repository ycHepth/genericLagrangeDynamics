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

% ================================
% inertia_1 = [Ix1,  Ixy1, Ixz1;
%              Ixy1, Iy1,  Iyz1;
%              Ixz1, Iyz1, Iz1];
% mass_center = [xc1, yc1, zc1; 
%                xc2, yc2, zc2;
%                xc3, yc3, zc3];
% mass = [m1,m2,m3];

xc = mass_center(1);
yc = mass_center(2);
zc = mass_center(3);

Ixx= inertia_tensor(1,1);
Ixy= inertia_tensor(1,2);
Ixz= inertia_tensor(1,3);
Iyy= inertia_tensor(2,2);
Iyz= inertia_tensor(2,3);
Izz= inertia_tensor(3,3);

J11 = (-Ixx+Iyy+Izz)/2;
J12 = Ixy;
J13 = Ixz;
J14 = mass*xc;
J21 = Ixy;
J22 = (Ixx-Iyy+Izz)/2;
J23 = Iyz;
J24 = mass*yc;
J31 = Ixz;
J32 = Iyz;
J33 = (Ixx+Iyy-Izz)/2;
J34 = mass*zc;
J41 = mass*xc;
J42 = mass*yc;
J43 = mass*zc;
J44 = mass;

J = [J11 J12 J13 J14;
     J21 J22 J23 J24;
     J32 J32 J33 J34;
     J41 J42 J43 J44;];





end

