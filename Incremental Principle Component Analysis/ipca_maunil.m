%Paper Title: Haitao Zhao, Pong Chi Yuen, and James T Kwok. A novel incremental principal component analysis 
%and its application for face recognition. Systems, Man, and Cybernetics, Part B: Cybernetics, 
%IEEE Transactions on, 36(4):873{886, 2006.

%Paper Link : http://ieeexplore.ieee.org/document/1658299/

clear;
clc;

x1 = randi(5,[5 3]);
a = randi(5,[5 1]);
x = [x1 a];
        
m1 = mean(x1);
m2 = mean(x);

for i=1:1:size(x1,1)
    x1(i,:) = x1(i,:)- m1;
    x(i,:) = x(i,:)-m2;
end

sigma = x'*x;
sigma1 = x1'*x1;
sigma2 = sigma(1:size(sigma1,1),size(sigma1,2)+1:end);
sigma3 = sigma(size(sigma1,1)+1:end,size(sigma1,2)+1:end);


%PCP' of sigma 1 
rank = 3;       %Assuming square matrix
[U d] = eig(sigma1);
d = diag(d);
[d,index] = sort(d,'descend');

%No of positive eigen values
L=0;
for i=1:1:length(d)
    if(d(i)>0)
        L=L+1;
    end
end

U = U(:,index);
d = diag(d);    

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Step2 
I = ones(1,rank);
I = diag(I);

%I_actual = [I;zeros(L-rank,rank)];
P_approx = [I; zeros(L-rank,rank)] * sqrt(d(1:rank,1:rank)) * (U(1:rank,1:rank))';


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Step 3
Q1 = (d(1:L,1:L)^(-1/2))* (U(1:L,1:L))' * sigma2; 
raw = (sigma3 - (Q1' * Q1));   % Maybe here is the problem in formula for Q3 in Paper
[v2, d2] = eig(raw);
Q3 = v2*sqrt(d2)*v2';

    
%final = [P, Q_1; zeros(size(Q_3,1),size(P,2)), Q_3]; % [P Q_1; Q_2 Q_3]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Step 4

%QR Decomposition 

I_a = ones(1,size(sigma,1));
I_a = diag(I_a);
I = ones(1,rank);
I = diag(I);
I = [I;zeros(size(sigma,1)-rank,rank)];

L_r = I_a - I*I';
L_R = L_r*[Q1;Q3];
[Q R] = qr(L_R);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Step 5

%SVD computation 
Q1_Q3 = [Q1;Q3];
I = ones(1,rank);
I = diag(I);
add = zeros(size(I,2),size(Q1_Q3,1)-size(I,1));
I = [I add];
I1 = I*Q1_Q3;

svd_matrix = [(d(1:rank,1:rank).^(1/2)) I1;zeros(length(R),rank) R];
[U1 S1 V1] = svd(svd_matrix);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Step 6

I = ones(1,rank);
I = diag(I);
I = [I;zeros(size(Q,1)-size(I,1),size(I,2))];

left = ([I Q]);
left1 = left * U1;

right = [(U(1:rank,1:rank)) zeros(rank,size(V1,2)-rank)];
right_right = [zeros(size(V1,2)-rank,rank) eye(size(V1,2)-rank)];
right1 = [right;right_right];

right1 = (right1 * V1);

final_matrix = left*S1*right1';
p1 = final_matrix'*final_matrix;


