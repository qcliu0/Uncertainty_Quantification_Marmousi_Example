for ii = 1:nr
    
    ii

    outi = ii;

    tmpout = single(U(:,outi));

    % tmpout = single(sampler(:,outi));

    nsz = size(tmpout,1);
    nsz = nsz * 0.5;

    s = num2str(outi,'%04d\n');

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

end
