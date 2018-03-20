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

nx = 90*4+1;
nz = 30*4+1;

tmpVp = zeros(nx,nz);
tmpVs = zeros(nx,nz);

tmpVp = GLL2REGU(Vmodel(1:nsize/2));
tmpVs = GLL2REGU(Vmodel(nsize/2+1:nsize));

dscale = 250;

xindex1 = 120;
for ir = 1:nr2d
    tmp = GLL2REGU(sampler(1:nsize/2,ir));
    tmp1 = tmp(xindex1,:);
    Distri1(:,ir) = tmp1 * dscale + tmpVp(xindex1,:) ;
    distri1(:,ir) = tmp1 * dscale ;
end

Distri1 = flip(Distri1);
distri1 = flip(distri1);
figure;
plot(distri1,'DisplayName','distri1');
figure;
plot(Distri1,'DisplayName','distri1');

xindex1 = 180;
for ir = 1:nr2d
    tmp = GLL2REGU(sampler(1:nsize/2,ir));
    tmp1 = tmp(xindex1,:);
    Distri2(:,ir) = tmp1 * dscale + tmpVp(xindex1,:) ;
    distri2(:,ir) = tmp1 * dscale ;
end

Distri2 = flip(Distri2);
distri2 = flip(distri2);
figure;
plot(distri2,'DisplayName','distri1');
figure;
plot(Distri2,'DisplayName','distri1');

xindex1 = 270;
for ir = 1:nr2d
    tmp = GLL2REGU(sampler(1:nsize/2,ir));
    tmp1 = tmp(xindex1,:);
    Distri3(:,ir) = tmp1 * dscale + tmpVp(xindex1,:) ;
    distri3(:,ir) = tmp1 * dscale ;
end

Distri3 = flip(Distri3);
distri3 = flip(distri3);
figure;
plot(distri3,'DisplayName','distri1');
figure;
plot(Distri3,'DisplayName','distri1');

xindex1 = 120;
for ir = 1:nr2d
    tmp = GLL2REGU(sampler(nsize/2+1:nsize,ir));
    tmp1 = tmp(xindex1,:);
    Distri4(:,ir) = tmp1 * dscale + tmpVs(xindex1,:) ;
    distri4(:,ir) = tmp1 * dscale ;
end

Distri4 = flip(Distri4);
distri4 = flip(distri4);
% figure;
% plot(distri4,'DisplayName','distri1');
% figure;
% plot(Distri4,'DisplayName','distri1');
% 
xindex1 = 180;
for ir = 1:nr2d
    tmp = GLL2REGU(sampler(nsize/2+1:nsize,ir));
    tmp1 = tmp(xindex1,:);
    Distri5(:,ir) = tmp1 * dscale + tmpVs(xindex1,:) ;
    distri5(:,ir) = tmp1 * dscale ;
end

Distri5 = flip(Distri5);
distri5 = flip(distri5);
% figure;
% plot(distri5,'DisplayName','distri1');
% figure;
% plot(Distri5,'DisplayName','distri1');
% 
xindex1 = 270;
for ir = 1:nr2d
    tmp = GLL2REGU(sampler(nsize/2+1:nsize,ir));
    tmp1 = tmp(xindex1,:);
    Distri6(:,ir) = tmp1 * dscale + tmpVs(xindex1,:) ;
    distri6(:,ir) = tmp1 * dscale ;
end

Distri6 = flip(Distri6);
distri6 = flip(distri6);
% figure;
% plot(distri6,'DisplayName','distri1');
% figure;
% plot(Distri6,'DisplayName','distri1');




