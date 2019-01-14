xd = 1:121;
xd(:) = (xd(:)-1)*25;

opac=zeros(nr2d,1);
opac(:)=0.4;
figure;

ax=gca;
subplot(231);
plot1=plot(xd,aDistri1,'DisplayName','distri1');camroll(-90);
for ii=1:500
plot1(ii).Color(4)=opac(ii,1);
end
xlabel('Depth (m)');
ylabel('Vp (m/s)');
ylim([0 5000]);
% ax.XTick=[0 1000 2000 3000];

ax=gca;
subplot(232);
plot1=plot(xd,aDistri2,'DisplayName','distri1');camroll(-90);
for ii=1:500
plot1(ii).Color(4)=opac(ii,1);
end
%xlabel('Depth (m)');
ylabel('Vp (m/s)');
ylim([0 5000])
% ax.XTick=[0 1000 2000 3000];

ax=gca;
subplot(233);
plot1=plot(xd,aDistri3,'DisplayName','distri1');camroll(-90);
for ii=1:500
plot1(ii).Color(4)=opac(ii,1);
end
%xlabel('Depth (m)');
ylabel('Vp (m/s)');
ylim([0 5000])
% ax.XTick=[0 1000 2000 3000];

subplot(234);
plot1=plot(xd,adistri1,'DisplayName','distri1');camroll(-90);
for ii=1:500
plot1(ii).Color(4)=opac(ii,1);
end
xlabel('Depth (m)');
ylabel('Vp deviation (m/s)');
ylim([-1000 1000])
% ax.XTick=[0 1000 2000 3000];

subplot(235);
plot1=plot(xd,adistri2,'DisplayName','distri1');camroll(-90);
for ii=1:500
plot1(ii).Color(4)=opac(ii,1);
end
%xlabel('Depth (m)');
ylabel('Vp deviation (m/s)');
ylim([-1000 1000])
% ax.XTick=[0 1000 2000 3000];

subplot(236);
plot1=plot(xd,adistri3,'DisplayName','distri1');camroll(-90);
for ii=1:500
plot1(ii).Color(4)=opac(ii,1);
end
%xlabel('Depth (m)');
ylabel('Vp deviation (m/s)');
ylim([-1000 1000])
% ax.XTick=[0 1000 2000 3000];

figure;

subplot(231);
plot1=plot(xd,aDistri4,'DisplayName','distri1');camroll(-90);
for ii=1:500
plot1(ii).Color(4)=opac(ii,1);
end
xlabel('Depth (m)');
ylabel('Vs (m/s)');
ylim([0 4000])
% ax.XTick=[0 1000 2000 3000];


subplot(232);
plot1=plot(xd,aDistri5,'DisplayName','distri1');camroll(-90);
for ii=1:500
plot1(ii).Color(4)=opac(ii,1);
end
%xlabel('Depth (m)');
ylabel('Vs (m/s)');
ylim([0 4000])
% ax.XTick=[0 1000 2000 3000];

subplot(233);
plot1=plot(xd,aDistri6,'DisplayName','distri1');camroll(-90);
for ii=1:500
plot1(ii).Color(4)=opac(ii,1);
end
%xlabel('Depth (m)');
ylabel('Vs (m/s)');
ylim([0 4000])
% ax.XTick=[0 1000 2000 3000];


subplot(234);
plot1=plot(xd,adistri4,'DisplayName','distri1');camroll(-90);
for ii=1:500
plot1(ii).Color(4)=opac(ii,1);
end
xlabel('Depth (m)');
ylabel('Vs deviation (m/s)');
ylim([-1000 1000])
% ax.XTick=[0 1000 2000 3000];

subplot(235);
plot1=plot(xd,adistri5,'DisplayName','distri1');camroll(-90);
for ii=1:500
plot1(ii).Color(4)=opac(ii,1);
end
%xlabel('Depth (m)');
ylabel('Vs deviation (m/s)');
ylim([-1000 1000])
% ax.XTick=[0 1000 2000 3000];

subplot(236);
plot1=plot(xd,adistri6,'DisplayName','distri1');camroll(-90);
for ii=1:500
plot1(ii).Color(4)=opac(ii,1);
end
%xlabel('Depth (m)');
ylabel('Vs deviation (m/s)');
ylim([-1000 1000])
% ax.XTick=[0 1000 2000 3000];
