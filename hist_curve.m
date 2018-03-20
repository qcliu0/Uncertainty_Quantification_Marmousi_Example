rng default;

pts = 0:10:5000;

figure;

rindex =40;
r = Distri1(rindex,:);

[ff1,xf1,uf1]=ksdensity(r,pts);

xf1 = (xf1 - mean(xf1)) + mean(xf1);
ff1 = ff1 ;

r1 = aDistri1(rindex,:);

[ff2,xf2,uf2]=ksdensity(r1,pts);

% figure;
subplot(321);
plot(xf1,ff1,xf2,ff2);
legend('Posterior Distri','Prior Distri','Location','Best')
xlabel('Vp (m/s)')
title('X=3100, Z=1000')
rindex =60;
r = Distri1(rindex,:);

[ff1,xf1,uf1]=ksdensity(r,pts);

xf1 = (xf1 - mean(xf1)) + mean(xf1);
ff1 = ff1 ;

r1 = aDistri1(rindex,:);

[ff2,xf2,uf2]=ksdensity(r1,pts);

% figure;
subplot(322);
plot(xf1,ff1,xf2,ff2);
legend('Posterior Distri','Prior Distri','Location','Best')
xlabel('Vp (m/s)')
title('X=3100, Z=1500')

rindex =40;
r = Distri2(rindex,:);

[ff1,xf1,uf1]=ksdensity(r,pts);

xf1 = (xf1 - mean(xf1)) + mean(xf1);
ff1 = ff1 ;

r1 = aDistri2(rindex,:);

[ff2,xf2,uf2]=ksdensity(r1,pts);

% figure;
subplot(323);
plot(xf1,ff1,xf2,ff2);
legend('Posterior Distri','Prior Distri','Location','Best')
xlabel('Vp (m/s)')
title('X=4600, Z=1000')

rindex =60;
r = Distri2(rindex,:);

[ff1,xf1,uf1]=ksdensity(r,pts);

xf1 = (xf1 - mean(xf1)) + mean(xf1);
ff1 = ff1 ;

r1 = aDistri2(rindex,:);

[ff2,xf2,uf2]=ksdensity(r1,pts);

% figure;
subplot(324);
plot(xf1,ff1,xf2,ff2);
legend('Posterior Distri','Prior Distri','Location','Best')
xlabel('Vp (m/s)')
title('X=4600, Z=1500')



rindex =40;
r = Distri3(rindex,:);

[ff1,xf1,uf1]=ksdensity(r,pts);

xf1 = (xf1 - mean(xf1)) + mean(xf1);
ff1 = ff1 ;

r1 = aDistri3(rindex,:);

[ff2,xf2,uf2]=ksdensity(r1,pts);

% figure;
subplot(325);
plot(xf1,ff1,xf2,ff2);
legend('Posterior Distri','Prior Distri','Location','Best')
xlabel('Vp (m/s)')
title('X=6900, Z=1000')

rindex =60;
r = Distri3(rindex,:);

[ff1,xf1,uf1]=ksdensity(r,pts);

xf1 = (xf1 - mean(xf1)) + mean(xf1);
ff1 = ff1 ;

r1 = aDistri3(rindex,:);

[ff2,xf2,uf2]=ksdensity(r1,pts);

% figure;
subplot(326);
plot(xf1,ff1,xf2,ff2);
legend('Posterior Distri','Prior Distri','Location','Best')
xlabel('Vp (m/s)')
title('X=6900, Z=1500')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;

rindex =40;
r = Distri4(rindex,:);

[ff1,xf1,uf1]=ksdensity(r,pts);

xf1 = (xf1 - mean(xf1)) + mean(xf1);
ff1 = ff1 ;

r1 = aDistri4(rindex,:);

[ff2,xf2,uf2]=ksdensity(r1,pts);

% figure;
subplot(321);
plot(xf1,ff1,xf2,ff2);
legend('Posterior Distri','Prior Distri','Location','Best')
xlabel('Vs (m/s)')
title('X=3100, Z=1000')
rindex =60;
r = Distri4(rindex,:);

[ff1,xf1,uf1]=ksdensity(r,pts);

xf1 = (xf1 - mean(xf1)) + mean(xf1);
ff1 = ff1 ;

r1 = aDistri4(rindex,:);

[ff2,xf2,uf2]=ksdensity(r1,pts);

% figure;
subplot(322);
plot(xf1,ff1,xf2,ff2);
legend('Posterior Distri','Prior Distri','Location','Best')
xlabel('Vs (m/s)')
title('X=3100, Z=1500')

rindex =40;
r = Distri5(rindex,:);

[ff1,xf1,uf1]=ksdensity(r,pts);

xf1 = (xf1 - mean(xf1)) + mean(xf1);
ff1 = ff1 ;

r1 = aDistri5(rindex,:);

[ff2,xf2,uf2]=ksdensity(r1,pts);

% figure;
subplot(323);
plot(xf1,ff1,xf2,ff2);
legend('Posterior Distri','Prior Distri','Location','Best')
xlabel('Vs (m/s)')
title('X=4600, Z=1000')

rindex =60;
r = Distri5(rindex,:);

[ff1,xf1,uf1]=ksdensity(r,pts);

xf1 = (xf1 - mean(xf1)) + mean(xf1);
ff1 = ff1 ;

r1 = aDistri5(rindex,:);

[ff2,xf2,uf2]=ksdensity(r1,pts);

% figure;
subplot(324);
plot(xf1,ff1,xf2,ff2);
legend('Posterior Distri','Prior Distri','Location','Best')
xlabel('Vs (m/s)')
title('X=4600, Z=1500')



rindex =40;
r = Distri6(rindex,:);

[ff1,xf1,uf1]=ksdensity(r,pts);

xf1 = (xf1 - mean(xf1)) + mean(xf1);
ff1 = ff1 ;

r1 = aDistri6(rindex,:);

[ff2,xf2,uf2]=ksdensity(r1,pts);

% figure;
subplot(325);
plot(xf1,ff1,xf2,ff2);
legend('Posterior Distri','Prior Distri','Location','Best')
xlabel('Vs (m/s)')
title('X=6900, Z=1000')

rindex =60;
r = Distri6(rindex,:);

[ff1,xf1,uf1]=ksdensity(r,pts);

xf1 = (xf1 - mean(xf1)) + mean(xf1);
ff1 = ff1 ;

r1 = aDistri6(rindex,:);

[ff2,xf2,uf2]=ksdensity(r1,pts);

% figure;
subplot(326);
plot(xf1,ff1,xf2,ff2);
legend('Posterior Distri','Prior Distri','Location','Best')
xlabel('Vs (m/s)')
title('X=6900, Z=1500')


