
nsize = 67500;
nsize = nsize * 2;
% nsize = nsize + 10;

nr = 58;

ns = nr;

sampler = zeros(nsize,nr);
R = randn(nsize,nr);
sampler = R;

% sampler(100) = 1;

for ir = 1:nr
    ir
    for i = 1:1:ns

        s = num2str(i,'%04d\n');
        s1 = strcat('a_',s);
        fp = fopen(s1,'r');
        a = fscanf(fp,'%g\n');

        s1 = strcat('nu_',s);
        fp = fopen(s1,'r');
        nu = fscanf(fp,'%g\n');

        s1 = strcat('w_',s);
        fp = fopen(s1,'r');
        w = fread(fp,'double');

        wn = w(11:end);
        xtemp = dot(wn,sampler(:,ir));
        xtemp = xtemp*nu/a;
        
        fclose('all');

        sampler(:,ir) = sampler(:,ir) - xtemp.*wn;

    end
    
    for i = ns:-1:1

        s = num2str(i,'%04d\n');
        s1 = strcat('a_',s);
        fp = fopen(s1,'r');
        a = fscanf(fp,'%g\n');

        s1 = strcat('nu_',s);
        fp = fopen(s1,'r');
        nu = fscanf(fp,'%g\n');

        s1 = strcat('w_',s);
        fp = fopen(s1,'r');
        w = fread(fp,'double');

        wn = w(11:end);
        xtemp = dot(wn,sampler(:,ir));
        xtemp = xtemp*nu/a;
        
        fclose('all');

        sampler(:,ir) = sampler(:,ir) - xtemp.*wn;

    end
    
end
sampler = sampler - R;

k=nr;

[Q,~] = qr(sampler,0);
Zt = R' * Q;
Wt = sampler' * Q;
B = linsolve(Zt,Wt);
Bt = 0.5 * (B + B');

[Uhat,Sigma,~] = svd(Bt);

U = Q * Uhat;
DiagS = diag(Sigma,0);



% sampler(100) = sampler(100) - 1;
