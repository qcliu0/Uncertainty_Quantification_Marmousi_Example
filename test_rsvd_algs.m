% test the different rsvd algorithms
make_matrix = 1;
save_matrix = 0;

if make_matrix == 1
    fprintf('making matrix..\n');
    m = 3000; n = 3000; p = min(m,n);
    S = logspace(0,-2,p);
    S = diag(S);
    mat_filename = ['data/M_mat1.mat']
    M = make_matrix1(m,n,S,mat_filename,save_matrix);
    Mt = M + M';
    M = Mt;
    for i=1:m
        for j=1:n
%             if (i<m/2 & j<n/2)
%                 M(i,j)=M(i,j)+0.1;
%             elseif (i<m/2 & j<n)
%                 M(i,j)=M(i,j)+0.2;
%             elseif (i<m & j<n/2)
%                 M(i,j)=M(i,j)+0.2;
%             else
%                 M(i,j)=M(i,j)+0.3;
%             end
            M(i,j)=10;
            if (i<m/2 & j<n/2)
                M(i,j)=0.1;
            elseif (i<m/2 & j<n)
                M(i,j)=0.2;
            elseif (i<m & j<n/2)
                M(i,j)=0.2;
            else
                M(i,j)=0.3;
            end
            
        end
    end
    
    M = magic(3000);
    Mt = M;
%     M  = Mt + Mt';
%     M = y * y';

else
    load('data/M_mat1.mat');
    m = size(M,1);
    n = size(M,2);
end

% set params
k = 1000;
p = 0;
q = 0;
s = 1;

% fprintf('rsvd 1..\n');
% [U,Sigma,V] = rsvd_version1(M,k,p,q,s);
% whos M U Sigma V
% perror = norm(M - U*Sigma*V')/norm(M) * 100
% 
% pause
% 
% fprintf('rsvd 2..\n');
% [U,Sigma,V] = rsvd_version2(M,k,p,q,s);
% whos M U Sigma V
% perror = norm(M - U*Sigma*V')/norm(M) * 100
% 
% pause

% fprintf('rsvd 3..\n');
% kstep = 20;
% [U,Sigma,V] = rsvd_version3(M,k,kstep,q,s);
% perror = norm(M - U*Sigma*V')/norm(M) * 100

% fprintf('rsvd 4..\n');
% [U,Sigma] = rsvd_version4(M,k,p);
% whos M U Sigma V
% Mn = U*Sigma*U';
% perror = norm(M - U*Sigma*U')/norm(M) * 100

[U,S,V] = svd(M,0);

% MM = M * M';
% MMn = U*Sigma*Sigma*V';


% pause

