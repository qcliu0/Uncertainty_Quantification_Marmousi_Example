nsize = 67500;
nsize = nsize * 2;
Vmodel = zeros(nsize,1);


fp = fopen('./InvertedModel/proc000000_vp.bin','r');
a1 = fread(fp,1,'float');
Atmp = fread(fp,nsize/2,'float');
fclose(fp);

Vmodel(1:nsize/2) = Atmp;

fp = fopen('./InvertedModel/proc000000_vs.bin','r');
a1 = fread(fp,1,'float');
Atmp = fread(fp,nsize/2,'float');
fclose(fp);

Vmodel(1+nsize/2:nsize) = Atmp;


fp = fopen('./InitModel/proc000000_vp.bin','r');
a1 = fread(fp,1,'float');
Atmp = fread(fp,nsize/2,'float');
fclose(fp);

Vmodel0(1:nsize/2) = Atmp;

fp = fopen('./InitModel/proc000000_vs.bin','r');
a1 = fread(fp,1,'float');
Atmp = fread(fp,nsize/2,'float');
fclose(fp);

Vmodel0(1+nsize/2:nsize) = Atmp;

nlowrk = 55; 

Hflag = 0;

%Sigma1 = Sigma * Sigma + Sigma * 2 +  0*diag(ones(99,1));
Sigma1 = Sigma; %+ 0.001*diag(ones(99,1));

n_DiagS = sqrt(diag(Sigma1,0));

T_DiagS = Sigma1(1:nlowrk,1:nlowrk);
n_T_DiagS = sqrt(T_DiagS);
% T_DiagS = 1+sqrt(Sigma1(1:nlowrk,1:nlowrk)+diag(ones(nlowrk,1)));
% T_DiagS = Sigma1(1:nlowrk,1:nlowrk)/(Sigma1(1:nlowrk,1:nlowrk)+diag(ones(nlowrk,1)));

T_U = U(:,1:nlowrk)*n_T_DiagS;
T_out = zeros(nsize,1);
% 
% for i = 1:nsize    
%     T_out(i,1) = dot(T_U(i,1:nlowrk),U(i,1:nlowrk));
% end
% 
% n_sampler = R1;
% 
% for ir =1:1000
%     ir
%     %for i = 1:nlowrk
% %         n_sampler(:,ir) = dot(R1(:,ir),T_U(:,1:nlowrk))*U;
%         n_sampler(:,ir) = T_U(:,1:1)*(U(:,1:1)'*R1(:,ir));%*U(:,1:nlowrk)';
%     %end
% end

tmpout = single(n_sampler(:,100))*150;

tmpout = tmpout + Vmodel;

nsz = size(tmpout,1);
nsz = nsz * 0.5;

nx = 90*4+1;
nz = 30*4+1;
xx = zeros(nx,nz);
xx1 = zeros(nx,nz);

GLLX = tmpout(1:nsz);
xx = GLL2REGU(GLLX);

GLLX = tmpout(nsz+1:end);
xx1 = GLL2REGU(GLLX);

s = 'sampling';

mkdir(s); 
cd(s);

copyfile('../proc000000*','./')
copyfile('../a.out','./')
copyfile('../plot_kernel.gnu','./')


a1 = 2000.0;
fp = fopen('proc000000_vp.bin','w');
fwrite(fp,a1,'float');
fwrite(fp,tmpout(1:nsize/2),'float');
fwrite(fp,a1,'float');
fclose(fp);

fp = fopen('proc000000_vs.bin','w');
fwrite(fp,a1,'float');
fwrite(fp,tmpout(nsize/2+1:end),'float');
fwrite(fp,a1,'float');
fclose(fp);

status = system('./a.out');

status = system('gnuplot plot_kernel.gnu');


cd ..