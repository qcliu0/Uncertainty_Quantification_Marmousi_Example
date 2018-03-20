nx = 90*4+1;
nz = 30*4+1;

colnum=168;

distr1=zeros(nr2d,nz);
distr2=zeros(nr2d,nz);
distr3=zeros(nr2d,nz);

tmp = zeros(nx,nz);

for ir = 1:nr2d
    ir
    tmp = GLL2REGU(sampler(1:nsize/2,ir));
    tmp1 = tmp(colnum,:);
    distr1(ir,:) = tmp(colnum,:);
end

distr1 = flipud(distr1');


for ir = 1:nr2d
    ir
    tmp = GLL2REGU(R1(1:nsize/2,ir));
    tmp1 = tmp(colnum,:);
    distr2(ir,:) = tmp(colnum,:);
end

distr2 = flipud(distr2');

figure;plot(distr1,'DisplayName','distr1');

figure;plot(distr2,'DisplayName','distr2');

for i = 1:10:121
    figure;histogram(distr1(i,:),'BinLimits',[-0.04,0.04]);
end