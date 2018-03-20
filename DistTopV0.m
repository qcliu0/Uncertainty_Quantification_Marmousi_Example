nsize = 67500;
nsize = nsize * 2;
Vmodel0 = zeros(nsize,1);

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

nx = 90*4+1;
nz = 30*4+1;

tmpVp0 = zeros(nx,nz);
tmpVs0 = zeros(nx,nz);

tmpVp0 = GLL2REGU(Vmodel0(1:nsize/2));
tmpVs0 = GLL2REGU(Vmodel0(nsize/2+1:nsize));

dscale = 250;

xindex1 = 120;
for ir = 1:nr2d
    tmp = GLL2REGU(R1(1:nsize/2,ir));
    tmp1 = tmp(xindex1,:);
    aDistri1(:,ir) = tmp1 * dscale + tmpVp0(xindex1,:) ;
    adistri1(:,ir) = tmp1 * dscale ;
end

aDistri1 = flip(aDistri1);
adistri1 = flip(adistri1);
% figure;
% plot(distri1,'DisplayName','distri1');
% figure;
% plot(Distri1,'DisplayName','distri1');

xindex1 = 180;
for ir = 1:nr2d
    tmp = GLL2REGU(R1(1:nsize/2,ir));
    tmp1 = tmp(xindex1,:);
    aDistri2(:,ir) = tmp1 * dscale + tmpVp0(xindex1,:) ;
    adistri2(:,ir) = tmp1 * dscale ;
end

aDistri2 = flip(aDistri2);
adistri2 = flip(adistri2);
% figure;
% plot(distri2,'DisplayName','distri1');
% figure;
% plot(Distri2,'DisplayName','distri1');

xindex1 = 270;
for ir = 1:nr2d
    tmp = GLL2REGU(R1(1:nsize/2,ir));
    tmp1 = tmp(xindex1,:);
    aDistri3(:,ir) = tmp1 * dscale + tmpVp0(xindex1,:) ;
    adistri3(:,ir) = tmp1 * dscale ;
end

aDistri3 = flip(aDistri3);
adistri3 = flip(adistri3);
% figure;
% plot(distri3,'DisplayName','distri1');
% figure;
% plot(Distri3,'DisplayName','distri1');

xindex1 = 120;
for ir = 1:nr2d
    tmp = GLL2REGU(R1(nsize/2+1:nsize,ir));
    tmp1 = tmp(xindex1,:);
    aDistri4(:,ir) = tmp1 * dscale + tmpVs0(xindex1,:) ;
    adistri4(:,ir) = tmp1 * dscale ;
end

aDistri4 = flip(aDistri4);
adistri4 = flip(adistri4);
% figure;
% plot(distri4,'DisplayName','distri1');
% figure;
% plot(Distri4,'DisplayName','distri1');
% 
xindex1 = 180;
for ir = 1:nr2d
    tmp = GLL2REGU(R1(nsize/2+1:nsize,ir));
    tmp1 = tmp(xindex1,:);
    aDistri5(:,ir) = tmp1 * dscale + tmpVs0(xindex1,:) ;
    adistri5(:,ir) = tmp1 * dscale ;
end

aDistri5 = flip(aDistri5);
adistri5 = flip(adistri5);
% figure;
% plot(distri5,'DisplayName','distri1');
% figure;
% plot(Distri5,'DisplayName','distri1');
% 
xindex1 = 270;
for ir = 1:nr2d
    tmp = GLL2REGU(R1(nsize/2+1:nsize,ir));
    tmp1 = tmp(xindex1,:);
    aDistri6(:,ir) = tmp1 * dscale + tmpVs0(xindex1,:) ;
    adistri6(:,ir) = tmp1 * dscale ;
end

aDistri6 = flip(aDistri6);
adistri6 = flip(adistri6);
% figure;
% plot(distri6,'DisplayName','distri1');
% figure;
% plot(Distri6,'DisplayName','distri1');
