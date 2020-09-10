
clc;
clear;
syms q1 q2 q3 m1 m2 m3 d2 real
syms Ix1 Iy1 Iz1 Ixy1 Iyz1 Ixz1 real
syms Ix2 Iy2 Iz2 Ixy2 Iyz2 Ixz2 real
syms Ix3 Iy3 Iz3 Ixy3 Iyz3 Ixz3 real
syms xc1 yc1 zc1 xc2 yc2 zc2 xc3 yc3 zc3 real

dh_params = [-pi/2, 0,  0, q1; 
             pi/2, 0, d2, q2;
             0, 0, 0, q3];
mass_center = [xc1, yc1, zc1; 
               xc2, yc2, zc2;
               xc3, yc3, zc3];
mass = [m1,m2,m3];
inertia_1 = [Ix1,  Ixy1, Ixz1;
             Ixy1, Iy1,  Iyz1;
             Ixz1, Iyz1, Iz1];
inertia_2 = [Ix2,  Ixy2, Ixz2;
             Ixy2, Iy2,  Iyz2;
             Ixz2, Iyz2, Iz2];
inertia_3 = [Ix3,  Ixy3, Ixz3;
             Ixy3, Iy3,  Iyz3;
             Ixz3, Iyz3, Iz3];
         
inertia_tensor(:,:,1) = inertia_1;
inertia_tensor(:,:,2) = inertia_2;
inertia_tensor(:,:,3) = inertia_3;

[h,c,g] = LagrangianDynamics(dh_params, mass, mass_center, inertia_tensor)

% h =
 
% [ Ix2 + Iy1 + Iy3 + d2^2*m2 + d2^2*m3 - Ix2*cos(q2)^2 + Ix3*cos(q3)^2 - Iy3*cos(q2)^2 - Iy3*cos(q3)^2 + Iz2*cos(q2)^2 + Iz3*cos(q2)^2 + Ixy3*sin(2*q3) + Ixz2*sin(2*q2) - Ix3*cos(q2)^2*cos(q3)^2 + Iy3*cos(q2)^2*cos(q3)^2 + 2*d2*m2*yc1 + 2*Ixz3*cos(q2)*cos(q3)*sin(q2) - 2*Iyz3*cos(q2)*sin(q2)*sin(q3) + 2*d2*m3*yc1*cos(q3) + 2*d2*m3*xc1*sin(q3) - 2*Ixy3*cos(q2)^2*cos(q3)*sin(q3), Ixy2*sin(q2) - Iyz2*cos(q2) - Ixy3*sin(q2) - Iyz3*cos(q2)*cos(q3) - Ixz3*cos(q2)*sin(q3) + 2*Ixy3*cos(q3)^2*sin(q2) - Ix3*cos(q3)*sin(q2)*sin(q3) + Iy3*cos(q3)*sin(q2)*sin(q3) - d2*m2*zc1*cos(q2) - d2*m3*zc1*cos(q2) + d2*m2*xc1*sin(q2) + d2*m3*xc1*cos(q3)*sin(q2) - d2*m3*yc1*sin(q2)*sin(q3), Iz3*cos(q2) + Ixz3*cos(q3)*sin(q2) - Iyz3*sin(q2)*sin(q3) + d2*m3*yc1*cos(q2)*cos(q3) + d2*m3*xc1*cos(q2)*sin(q3)]
% [                                                                                      Ixy2*sin(q2) - Iyz2*cos(q2) - Ixy3*sin(q2) - Iyz3*cos(q2)*cos(q3) - Ixz3*cos(q2)*sin(q3) + 2*Ixy3*cos(q3)^2*sin(q2) - Ix3*cos(q3)*sin(q2)*sin(q3) + Iy3*cos(q3)*sin(q2)*sin(q3) - d2*m2*zc1*cos(q2) - d2*m3*zc1*cos(q2) + d2*m2*xc1*sin(q2) + d2*m3*xc1*cos(q3)*sin(q2) - d2*m3*yc1*sin(q2)*sin(q3),                                                                                                                                                                                                                        Ix3/2 + Iy2 + Iy3/2 - (Ix3*cos(2*q3))/2 + (Iy3*cos(2*q3))/2 - Ixy3*sin(2*q3),                                                                                     - Iyz3*cos(q3) - Ixz3*sin(q3)]
% [                                                                                                                                                                                                                                                                        Iz3*cos(q2) + Ixz3*cos(q3)*sin(q2) - Iyz3*sin(q2)*sin(q3) + d2*m3*yc1*cos(q2)*cos(q3) + d2*m3*xc1*cos(q2)*sin(q3),                                                                                                                                                                                                                                                                       - Iyz3*cos(q3) - Ixz3*sin(q3),                                                                                                               Iz3]
 
 
% c =
 
% [ dq2*(Iyz3*sin(q3) - Ixz3*cos(q3) - Ixz2 + 2*Ixz2*cos(q2)^2 + (Ix2*sin(2*q2))/2 + (Iy3*sin(2*q2))/2 - (Iz2*sin(2*q2))/2 - (Iz3*sin(2*q2))/2 + 2*Ixz3*cos(q2)^2*cos(q3) - 2*Iyz3*cos(q2)^2*sin(q3) + Ix3*cos(q2)*cos(q3)^2*sin(q2) - Iy3*cos(q2)*cos(q3)^2*sin(q2) + 2*Ixy3*cos(q2)*cos(q3)*sin(q2)*sin(q3)) - dq3*(Ixy3 - Ixy3*cos(q2)^2 - 2*Ixy3*cos(q3)^2 + (Ix3*sin(2*q3))/2 - (Iy3*sin(2*q3))/2 + 2*Ixy3*cos(q2)^2*cos(q3)^2 + Iyz3*cos(q2)*cos(q3)*sin(q2) + Ixz3*cos(q2)*sin(q2)*sin(q3) - d2*m3*xc1*cos(q3) + d2*m3*yc1*sin(q3) - Ix3*cos(q2)^2*cos(q3)*sin(q3) + Iy3*cos(q2)^2*cos(q3)*sin(q3)), dq1*(Iyz3*sin(q3) - Ixz3*cos(q3) - Ixz2 + 2*Ixz2*cos(q2)^2 + (Ix2*sin(2*q2))/2 + (Iy3*sin(2*q2))/2 - (Iz2*sin(2*q2))/2 - (Iz3*sin(2*q2))/2 + 2*Ixz3*cos(q2)^2*cos(q3) - 2*Iyz3*cos(q2)^2*sin(q3) + Ix3*cos(q2)*cos(q3)^2*sin(q2) - Iy3*cos(q2)*cos(q3)^2*sin(q2) + 2*Ixy3*cos(q2)*cos(q3)*sin(q2)*sin(q3)) + dq2*(Ixy2*cos(q2) - Ixy3*cos(q2) + Iyz2*sin(q2) + Iyz3*cos(q3)*sin(q2) + Ixz3*sin(q2)*sin(q3) + 2*Ixy3*cos(q2)*cos(q3)^2 - Ix3*cos(q2)*cos(q3)*sin(q3) + Iy3*cos(q2)*cos(q3)*sin(q3) + d2*m2*xc1*cos(q2) + d2*m2*zc1*sin(q2) + d2*m3*zc1*sin(q2) + d2*m3*xc1*cos(q2)*cos(q3) - d2*m3*yc1*cos(q2)*sin(q3)) - (dq3*sin(q2)*(Iz3 + Ix3*(2*cos(q3)^2 - 1) - Iy3*(2*cos(q3)^2 - 1) + 4*Ixy3*cos(q3)*sin(q3) + 2*d2*m3*yc1*cos(q3) + 2*d2*m3*xc1*sin(q3)))/2, - dq3*(Iyz3*cos(q3)*sin(q2) + Ixz3*sin(q2)*sin(q3) - d2*m3*xc1*cos(q2)*cos(q3) + d2*m3*yc1*cos(q2)*sin(q3)) - dq1*(Ixy3 - Ixy3*cos(q2)^2 - 2*Ixy3*cos(q3)^2 + (Ix3*sin(2*q3))/2 - (Iy3*sin(2*q3))/2 + 2*Ixy3*cos(q2)^2*cos(q3)^2 + Iyz3*cos(q2)*cos(q3)*sin(q2) + Ixz3*cos(q2)*sin(q2)*sin(q3) - d2*m3*xc1*cos(q3) + d2*m3*yc1*sin(q3) - Ix3*cos(q2)^2*cos(q3)*sin(q3) + Iy3*cos(q2)^2*cos(q3)*sin(q3)) - (dq2*sin(q2)*(Iz3 + Ix3*(2*cos(q3)^2 - 1) - Iy3*(2*cos(q3)^2 - 1) + 4*Ixy3*cos(q3)*sin(q3) + 2*d2*m3*yc1*cos(q3) + 2*d2*m3*xc1*sin(q3)))/2]
% [                                                                                                  dq3*((Ix3*sin(q2))/2 - (Iy3*sin(q2))/2 + (Iz3*sin(q2))/2 - Ixz3*cos(q2)*cos(q3) + Iyz3*cos(q2)*sin(q3) - Ix3*cos(q3)^2*sin(q2) + Iy3*cos(q3)^2*sin(q2) - 2*Ixy3*cos(q3)*sin(q2)*sin(q3)) - dq1*(Iyz3*sin(q3) - Ixz3*cos(q3) - Ixz2 + 2*Ixz2*cos(q2)^2 + (Ix2*sin(2*q2))/2 + (Iy3*sin(2*q2))/2 - (Iz2*sin(2*q2))/2 - (Iz3*sin(2*q2))/2 + 2*Ixz3*cos(q2)^2*cos(q3) - 2*Iyz3*cos(q2)^2*sin(q3) + Ix3*cos(q2)*cos(q3)^2*sin(q2) - Iy3*cos(q2)*cos(q3)^2*sin(q2) + 2*Ixy3*cos(q2)*cos(q3)*sin(q2)*sin(q3)),                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       -dq3*(Ixy3*cos(2*q3) - (Ix3*sin(2*q3))/2 + (Iy3*sin(2*q3))/2),                                                                                                                                                                                                           Ixy3*dq2 - 2*Ixy3*dq2*cos(q3)^2 + (Ix3*dq2*sin(2*q3))/2 - (Iy3*dq2*sin(2*q3))/2 - Ixz3*dq3*cos(q3) + (Ix3*dq1*sin(q2))/2 - (Iy3*dq1*sin(q2))/2 + Iyz3*dq3*sin(q3) + (Iz3*dq1*sin(q2))/2 - Ix3*dq1*cos(q3)^2*sin(q2) + Iy3*dq1*cos(q3)^2*sin(q2) - Ixz3*dq1*cos(q2)*cos(q3) + Iyz3*dq1*cos(q2)*sin(q3) - 2*Ixy3*dq1*cos(q3)*sin(q2)*sin(q3)]
% [                                                                                                                   dq1*(Ixy3 - Ixy3*cos(q2)^2 - 2*Ixy3*cos(q3)^2 + (Ix3*sin(2*q3))/2 - (Iy3*sin(2*q3))/2 + 2*Ixy3*cos(q2)^2*cos(q3)^2 + Iyz3*cos(q2)*cos(q3)*sin(q2) + Ixz3*cos(q2)*sin(q2)*sin(q3) - d2*m3*xc1*cos(q3) + d2*m3*yc1*sin(q3) - Ix3*cos(q2)^2*cos(q3)*sin(q3) + Iy3*cos(q2)^2*cos(q3)*sin(q3)) - dq2*((Ix3*sin(q2))/2 - (Iy3*sin(q2))/2 + (Iz3*sin(q2))/2 - Ixz3*cos(q2)*cos(q3) + Iyz3*cos(q2)*sin(q3) - Ix3*cos(q3)^2*sin(q2) + Iy3*cos(q3)^2*sin(q2) - 2*Ixy3*cos(q3)*sin(q2)*sin(q3)),                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 dq2*(Ixy3*(2*cos(q3)^2 - 1) - Ix3*cos(q3)*sin(q3) + Iy3*cos(q3)*sin(q3)) - dq1*((Ix3*sin(q2))/2 - (Iy3*sin(q2))/2 + (Iz3*sin(q2))/2 - Ixz3*cos(q2)*cos(q3) + Iyz3*cos(q2)*sin(q3) - Ix3*cos(q3)^2*sin(q2) + Iy3*cos(q3)^2*sin(q2) - 2*Ixy3*cos(q3)*sin(q2)*sin(q3)),                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    0]
 
% ==================
% calculated g term is equal !!
% ==================
% g =
 
%                                                                                                         0
%  -gc*(m2*xc2*cos(q2) + m2*zc2*sin(q2) + m3*zc3*sin(q2) + m3*xc3*cos(q2)*cos(q3) - m3*yc3*cos(q2)*sin(q3))
%                                                                 gc*m3*sin(q2)*(yc3*cos(q3) + xc3*sin(q3))
 