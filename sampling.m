nlowrk = nr; 

Hflag = 0;

%Sigma1 = Sigma * Sigma + Sigma * 2 +  0*diag(ones(99,1));

Sigma1 = Sigma + 0.001*diag(ones(nlowrk,1));
if Hflag == 1
    Sigma1 = inv(Sigma1);
end

DiagS = diag(Sigma,0);



% Sigma1 = inv(Sigma-1)*1;
% 
% Sigma1 = sqrt(Sigma);
% Sigma1 = Sigma1 * Sigma1 + 2 * Sigma1;

% T_DiagS = inv(inv(Sigma(1:nlowrk,1:nlowrk)*Sigma(1:nlowrk,1:nlowrk))+diag(ones(nlowrk,1)));

% T_DiagS = Sigma1(1:nlowrk,1:nlowrk)*inv(Sigma1(1:nlowrk,1:nlowrk)+diag(ones(nlowrk,1)));

%T_DiagS = Sigma1(1:nlowrk,1:nlowrk)/(Sigma1(1:nlowrk,1:nlowrk)+diag(ones(nlowrk,1)));

%T_DiagS = diag(ones(nlowrk,1))/(Sigma1(1:nlowrk,1:nlowrk)+diag(ones(nlowrk,1)));

T_DiagS = Sigma1(1:nlowrk,1:nlowrk);

% T_DiagS = 1+sqrt(Sigma1(1:nlowrk,1:nlowrk)+diag(ones(nlowrk,1)));
% T_DiagS = Sigma1(1:nlowrk,1:nlowrk)/(Sigma1(1:nlowrk,1:nlowrk)+diag(ones(nlowrk,1)));

T_U = U(:,1:nlowrk)*T_DiagS;
T_out = zeros(nsize,1);

np1=67500*11/12-(25*2+12)+0 + 0*67500;

for i = 1:nsize    
    T_out(i,1) = dot(T_U(i,1:nlowrk),U(i,1:nlowrk));
    if Hflag == 1
        %T_out(i,1) = dot(T_U(i,1:nlowrk),U(i,1:nlowrk));
        T_out(i,1) = dot(T_U(np1,1:nlowrk),U(i,1:nlowrk));
    end
end
tmpout = single(sqrt(T_out));
if Hflag == 1
     %tmpout = single(sqrt(T_out));
     %tmpout = sqrt(tmpout);
     %tmpout = single((T_out));     
end

if Hflag == 1
    for i = 29*25*90:30*25*90
        tmpout(i,1) = tmpout(i,1)*0.001;
    end
end

aver = mean(tmpout)

for i = 1:nsize
    if tmpout(i,1)>10*aver
        %tmpout(i,1)=10*aver;
    end
end

nsz = size(tmpout,1);
% nsz = nsz * 0.5;

nx = 90*4+1;
nz = 30*4+1;
xx = zeros(nx,nz);
xx1 = zeros(nx,nz);

GLLX = tmpout(1:nsz);
xx = GLL2REGU(GLLX);


s = 'sampling';

mkdir(s); 
cd(s);

copyfile('../proc000000*','./')
copyfile('../a.out','./')
copyfile('../plot_kernel.gnu','./')

a1 = 0.0;
fp = fopen('proc000000_vp.bin','w');
fwrite(fp,a1,'float');
fwrite(fp,tmpout(1:nsz),'float');
fclose(fp);

fp = fopen('proc000000_vs.bin','w');
fwrite(fp,a1,'float');
fwrite(fp,tmpout(nsz+1:end),'float');
fclose(fp);

status = system('./a.out');

status = system('gnuplot plot_kernel.gnu');


cd ..