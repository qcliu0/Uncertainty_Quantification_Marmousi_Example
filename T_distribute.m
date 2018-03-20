npara = 2;

nsize = 67500;
nsize = nsize * 2;
% nsize = nsize + 10;

nr2d = 1000;

ns = nr;

R1 = zeros(nsize,nr2d);

for ir = 1:nr2d
    ir
    R1(:,ir) = d2gauss_generator();
end

sampler = zeros(nsize,nr2d);
% R = randn(nsize,nr);

sampler = R1;

% sampler(100) = 1;

for ir = 1:nr2d
    ir
    
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

    %     sz = size(wn)
    %     sz = size(sampler)
        wn = w(11:end);
        xtemp = dot(wn,sampler(:,ir));
        xtemp = xtemp*nu/a;
        
        fclose('all');

        sampler(:,ir) = sampler(:,ir) - xtemp.*wn;

    end
    
end

sampler = sampler - R1;

sampler = sampler * 0.5;

sampler = sampler / npara;

sampler_stack = zeros(nsize,1);

for ir = 1:nr2d
    sampler_stack = sampler_stack + sampler(:,ir);
end

sampler_stack = sampler_stack / nr2d;

R_stack = zeros(nsize,1);

for ir = 1:nr2d
    R_stack = R_stack + R1(:,ir);
end

R_stack = R_stack / nr2d;

nx = 90*4+1;
nz = 30*4+1;

distr1=zeros(nz,nr2d);
distr2=zeros(nz,nr2d);
tmp = zeros(nx,nz);

for ir = 1:nr2d
    tmp = GLL2REGU(sampler(1:nsize/2,ir));
    tmp1 = tmp(168,:);
    distri1(:,ir) = tmp1;
end
    