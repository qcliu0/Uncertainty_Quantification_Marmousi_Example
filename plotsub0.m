xd = 1:121;
xd(:) = (xd(:)-1)*25;

figure;

subplot(231);
plot(xd,aDistri1,'DisplayName','distri1');camroll(-90);
subplot(232);
plot(xd,aDistri2,'DisplayName','distri1');camroll(-90);
subplot(233);
plot(xd,aDistri3,'DisplayName','distri1');camroll(-90);

subplot(234);
plot(xd,adistri1,'DisplayName','distri1');camroll(-90);
subplot(235);
plot(xd,adistri2,'DisplayName','distri1');camroll(-90);
subplot(236);
plot(xd,adistri3,'DisplayName','distri1');camroll(-90);

figure;

subplot(231);
plot(xd,aDistri4,'DisplayName','distri1');camroll(-90);
subplot(232);
plot(xd,aDistri5,'DisplayName','distri1');camroll(-90);
subplot(233);
plot(xd,aDistri6,'DisplayName','distri1');camroll(-90);

subplot(234);
plot(xd,adistri4,'DisplayName','distri1');camroll(-90);
subplot(235);
plot(xd,adistri5,'DisplayName','distri1');camroll(-90);
subplot(236);
plot(xd,adistri6,'DisplayName','distri1');camroll(-90);