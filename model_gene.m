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


dscale = 150;

inr2d = 1;
for ir = 1:1
    Vmodel =  0*Vmodel + dscale * sampler(:,inr2d);
end

copyfile('../proc000000*','./')
copyfile('../a.out','./')
copyfile('../plot_kernel.gnu','./')

a1 = 000.0;
fp = fopen('proc000000_vp.bin','w');
fwrite(fp,a1,'float');
fwrite(fp,Vmodel(1:nsize/2),'float');
fwrite(fp,a1,'float');
fclose(fp);

fp = fopen('proc000000_vs.bin','w');
fwrite(fp,a1,'float');
fwrite(fp,Vmodel(nsize/2+1:end),'float');
fwrite(fp,a1,'float');
fclose(fp);


status = system('./a.out');

status = system('gnuplot plot_kernel.gnu');

