xd = 1:121;
xd(:) = (xd(:)-1)*25;

figure;

subplot(231);
plot(xd,Distri1,'DisplayName','distri1');camroll(-90);
subplot(232);
plot(xd,Distri2,'DisplayName','distri1');camroll(-90);
subplot(233);
plot(xd,Distri3,'DisplayName','distri1');camroll(-90);

subplot(234);
plot(xd,distri1,'DisplayName','distri1');camroll(-90);
subplot(235);
plot(xd,distri2,'DisplayName','distri1');camroll(-90);
subplot(236);
plot(xd,distri3,'DisplayName','distri1');camroll(-90);

figure;

subplot(231);
plot(xd,Distri4,'DisplayName','distri1');camroll(-90);
subplot(232);
plot(xd,Distri5,'DisplayName','distri1');camroll(-90);
subplot(233);
plot(xd,Distri6,'DisplayName','distri1');camroll(-90);

subplot(234);
plot(xd,distri4,'DisplayName','distri1');camroll(-90);
subplot(235);
plot(xd,distri5,'DisplayName','distri1');camroll(-90);
subplot(236);
plot(xd,distri6,'DisplayName','distri1');camroll(-90);