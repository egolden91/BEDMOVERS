function [common_sec_ind] = overlap_sector(A_noraml_vec,B_noraml_vec)
%finds the common sector of the unit circle given 2 sets of normal vectors.
% Inputs
%   A_noraml_vec - set of Nax2 unit vectors represents A polygonial robot
%   normal vectors.
%   B_noraml_vec - set of Nbx2 unit vectors represents A polygonial obstacle
%   normal vectors.
% Outputs
%   common_sec_ind - Na+Nb x 2 array. each row is a pair of indices matches
%   the vertices that overlap using the circle merging method
A_neg_noraml_vec = -A_noraml_vec;
Na=length(A_noraml_vec);
Nb=length(B_noraml_vec);

alpha_vec_assort = zeros([Na,1]);
beta_vec_assort = zeros([Nb,1]);

% Calculating normals CW angle from a referance vector.
ref_vec = [1,0];
for ka=1:Na
    alpha_vec_assort(ka) = vect_cw_angle_2d(ref_vec ,A_neg_noraml_vec(ka,:));
end
[alpha_vec,ia_sort] = sort(alpha_vec_assort,'ascend');
for kb=1:Nb
    beta_vec_assort(kb) = vect_cw_angle_2d(ref_vec ,B_noraml_vec(kb,:));
end
[beta_vec,ib_sort] = sort(beta_vec_assort,'ascend');
% Merging circles loop 
%   intialization
Ncommon = length(intersect(alpha_vec,beta_vec));
Ntot = Na+Nb-Ncommon; % Total amount of vertices of the c-obstacle
k=0; ka=1; kb=1;
a_cycle = 0;
b_cycle = 0;
common_sec_ind=zeros([Ntot,2]);
while k<Ntot
    k=k+1;
    alpha = alpha_vec(ka)+a_cycle*360;
    beta = beta_vec(kb)+b_cycle*360;
    angle_diff_sign = sign(alpha-beta);
    switch angle_diff_sign
        case 1
            b_cycle=b_cycle+1*(kb==Nb);
            kb=mod(kb,Nb)+1;
        case -1
            a_cycle=a_cycle+1*(ka==Nb);
            ka=mod(ka,Na)+1;
        case 0
            a_cycle=a_cycle+1*(ka==Nb);
            b_cycle=b_cycle+1*(kb==Nb);
            ka=mod(ka,Na)+1;
            kb=mod(kb,Nb)+1;
    end
    common_sec_ind(k,:) = [ia_sort(ka),ib_sort(kb)];

end