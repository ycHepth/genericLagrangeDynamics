function [H,C,G] = LagrangianDynamics(dh_list, mass_list, mass_center_list, inertia_tensor_list)
% reference:https://www.jianshu.com/p/6d04539f1cfe
% check DH parameters list
[rows, columns] = size(dh_list);
number_of_links = rows;
if columns ~= 4
    error('wrong DH parameters!')
end

for i = 1:rows
    % define symbol of general position/velocity/acceleration 
    % using 'eval()' function
    eval(['syms ','q',num2str(i),' real;']);
    eval(['syms ','dq',num2str(i),' real;']);
    eval(['syms ','ddq',num2str(i),' real;']);
    eval(['q(i)=','q',num2str(i),';']);
    eval(['dq(i)=','dq',num2str(i),';']);
    eval(['ddq(i)=','ddq',num2str(i),';']);
end

% transform matrix A
A = sym([]); 
for i = 1:number_of_links
    dh = dh_list(i,:);
    alpha(i) = dh(1);
    a(i) = dh(2);
    d(i) = dh(3);
    q(i) = dh(4);
    A(:,:,i) = [cos(q(i)),   -sin(q(i))*cos(alpha(i)),       sin(alpha(i))*sin(q(i)),  a(i)*cos(q(i));
                sin(q(i)),    cos(q(i))*cos(alpha(i)),      -sin(alpha(i))*cos(q(i)),  a(i)*sin(q(i));
                0,            sin(alpha(i)),                 cos(alpha(i)),            d(i);
                0,                       0,                       0,                   1];
end
A = simplify(A);

% calculate th expression of each linkage coordinate to {0} coordinate
A0 = sym([]);
for i = 1:number_of_links
    A0(:,:,i) = eye(4,4);
    for j = 1:i
        A0(:,:,i) = A0(:,:,i)*A(:,:,j);
    end
end
A0 = simplify(A0);

J = sym([]);
for i = 1:number_of_links
    J(:,:,i) = JMatrix(mass_list(i),mass_center_list(i,:),inertia_tensor_list(:,:,i));
end

syms tr
for i = 1:number_of_links
    for j = i:number_of_links
        tr = 0;
        for k = j:number_of_links
            tr = tr + trace(eval(['diff(A0(:,:,k),q',num2str(i),')'])*J(:,:,k)*...
                eval(['diff(transpose(A0(:,:,k)),q',num2str(j),')']));
        end
        H(i,j) = simplify(tr);
        H(j,i) = H(i,j);
    end
end

% C(q)
for i = 1:number_of_links
    for j = 1:number_of_links
        c = 0;
        for k = 1:number_of_links
            c = c + 1/2*(eval(['diff(H(i,j),q',num2str(k),')'])...
                        + eval(['diff(H(i,k),q',num2str(j),')'])...
                        - eval(['diff(H(j,k),q',num2str(i),')']))*eval(['dq',num2str(k)]);
        end
        C(i,j) = simplify(c);
    end
end

syms gc
g = [0,0,-gc,0]';

% G(q)
for i = 1:number_of_links
    gi = 0;
    for j = 1:number_of_links
        gi = gi - mass_list(j)*g'...
                *eval(['diff(A0(:,:,j),q',num2str(i),')'])...
                *[mass_center_list(j,:),1]';
    end
    G(i) = simplify(gi);
end
G = G';

end