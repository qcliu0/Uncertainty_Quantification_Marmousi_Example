rng default;

pts = 1000:20:6000;
pts1 = -1000:8:1000;

AA = zeros(121,length(pts));
BB = AA;
CC = AA;
aa = AA;
bb = AA;
cc = AA;

for rindex =1:121
    
    r = Distri1(rindex,:);
    [ff1,xf1,uf1]=ksdensity(r,pts);
    AA(rindex,:) = ff1;    
    r = distri1(rindex,:);
    [ff1,xf1,uf1]=ksdensity(r,pts1);
    aa(rindex,:) = ff1;
        
    r = Distri2(rindex,:);
    [ff1,xf1,uf1]=ksdensity(r,pts);
    BB(rindex,:) = ff1;    
    r = distri2(rindex,:);
    [ff1,xf1,uf1]=ksdensity(r,pts1);
    bb(rindex,:) = ff1;    
    
    r = Distri3(rindex,:);
    [ff1,xf1,uf1]=ksdensity(r,pts);
    CC(rindex,:) = ff1;    
    r = distri3(rindex,:);
    [ff1,xf1,uf1]=ksdensity(r,pts1);
    cc(rindex,:) = ff1;  
    
end

AA = AA * 100;
BB = BB * 100;
CC = CC * 100;
aa = aa * 100;
bb = bb * 100;
cc = cc * 100;

AA = flipud(AA);
BB = flipud(BB);
CC = flipud(CC);
aa = flipud(aa);
bb = flipud(bb);
cc = flipud(cc);

xtmp = 0.0;
ytmp = 0.0;

fp = fopen('distri1.dat','w');
for i = 1:121
    for j = 1:length(pts)
        xtmp = j-1;
        ytmp = i-1;
        fprintf(fp,'%f %f %f %f %f %f %f %f\n',xtmp,ytmp,AA(i,j),BB(i,j),CC(i,j),aa(i,j),bb(i,j),cc(i,j));
    end
end



