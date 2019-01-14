xd = 1:121;
xd(:) = (xd(:)-1)*25;

opac=zeros(nr2d,1);
opac(:)=0.4;

figure;

subplot(231);
%title('Vp (m/s)');

plot1=plot(xd,Distri1,'DisplayName','distri1');camroll(-90);
for ii=1:500
plot1(ii).Color(4)=opac(ii,1);
end
xlabel('Depth (m)');
ylabel('Vp (m/s)');
ylim([1000 6000])

subplot(232);
plot1=plot(xd,Distri2,'DisplayName','distri1');camroll(-90);
for ii=1:500
plot1(ii).Color(4)=opac(ii,1);
end
%xlabel('Depth (m)');
ylabel('Vp (m/s)');
ylim([1000 6000])

subplot(233);
plot1=plot(xd,Distri3,'DisplayName','distri1');camroll(-90);
for ii=1:500
plot1(ii).Color(4)=opac(ii,1);
end
%xlabel('Depth (m)');
ylabel('Vp (m/s)');
ylim([1000 6000])

subplot(234);
plot1=plot(xd,distri1,'DisplayName','distri1');camroll(-90);
for ii=1:500
plot1(ii).Color(4)=opac(ii,1);
end
xlabel('Depth (m)');
ylabel('Vp deviation (m/s)');
ylim([-1000 1000])

subplot(235);
plot1=plot(xd,distri2,'DisplayName','distri1');camroll(-90);
for ii=1:500
plot1(ii).Color(4)=opac(ii,1);
end
%xlabel('Depth (m)');
ylabel('Vp deviation (m/s)');
ylim([-1000 1000])

subplot(236);
plot1=plot(xd,distri3,'DisplayName','distri1');camroll(-90);
for ii=1:500
plot1(ii).Color(4)=opac(ii,1);
end
%xlabel('Depth (m)');
ylabel('Vp deviation (m/s)');
ylim([-1000 1000])

figure;

subplot(231);
plot1=plot(xd,Distri4,'DisplayName','distri1');camroll(-90);
for ii=1:500
plot1(ii).Color(4)=opac(ii,1);
end
xlabel('Depth (m)');
ylabel('Vs (m/s)');
ylim([1000 4000])

subplot(232);
plot1=plot(xd,Distri5,'DisplayName','distri1');camroll(-90);
for ii=1:500
plot1(ii).Color(4)=opac(ii,1);
end
%xlabel('Depth (m)');
ylabel('Vs (m/s)');
ylim([1000 4000])

subplot(233);
plot1=plot(xd,Distri6,'DisplayName','distri1');camroll(-90);
for ii=1:500
plot1(ii).Color(4)=opac(ii,1);
end
%xlabel('Depth (m)');
ylabel('Vs (m/s)');
ylim([1000 4000])

subplot(234);
plot1=plot(xd,distri4,'DisplayName','distri1');camroll(-90);
for ii=1:500
plot1(ii).Color(4)=opac(ii,1);
end
xlabel('Depth (m)');
ylabel('Vs deviation (m/s)');
ylim([-1000 1000])

subplot(235);
plot1=plot(xd,distri5,'DisplayName','distri1');camroll(-90);
for ii=1:500
plot1(ii).Color(4)=opac(ii,1);
end
%xlabel('Depth (m)');
ylabel('Vs deviation (m/s)');
ylim([-1000 1000])

subplot(236);
plot1=plot(xd,distri6,'DisplayName','distri1');camroll(-90);
for ii=1:500
plot1(ii).Color(4)=opac(ii,1);
end
%xlabel('Depth (m)');
ylabel('Vs deviation (m/s)');
ylim([-1000 1000])
