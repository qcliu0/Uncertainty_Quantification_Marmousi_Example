function GLLX0 = d2gauss_generator()

nx = 90*4+1;
nz = 30*4+1;

r = 15; % radius (maximal 49)
r0 = r+1;
nx = nx + 2*r0;
nz = nz + 2*r0;

noise = randn(nx,nz);
noise1 = randn(nx,nz);
[x,y]=meshgrid(-r:r,-r:r);
mask=((x.^2+y.^2)<=r^2); %(2*r+1)x(2*r+1) bit mask

x = zeros(nx,nz);
x1 = zeros(nx,nz);

nxmin = r0; nxmax = nx-r0;
nzmin = r0; nzmax = nz-r0;

for i=nxmin:nxmax
    for j=nzmin:nzmax
        A = noise((i-r):(i+r), (j-r):(j+r));
        x(i,j) = sum(sum(A.*mask));
        A = noise1((i-r):(i+r), (j-r):(j+r));
        x1(i,j) = sum(sum(A.*mask));
    end
end
Nr = sum(sum(mask));

x = x(nxmin:nxmax, nzmin:nzmax)/Nr;
x1 = x1(nxmin:nxmax, nzmin:nzmax)/Nr;

x = (x - mean2(x))/std2(x);
x1 = (x1 - mean2(x1))/std2(x1);

y1 = x1;
y1 = 0;

nx = nx-2*r0;
nz = nz-2*r0;

% GLL stencil
GLLX=zeros(25*30*90,1);
% GLLX0=zeros(25*30*90*2,1);
GLLX1=zeros(25*30*90,1);


for j=1:30
    for i=1:90

        i0=(j-1)*90*25+(i-1)*25;

        ii=(i-1)*4+1;
        jj=(j-1)*4+1;

        for k=1:5
            nn=i0+k;
            GLLX(nn)=x(ii,jj);
            ii=ii+1;
        end

        ii=(i-1)*4+1;
        jj=(j-1)*4+1+1;

        for k=6:10
            nn=i0+k;
            GLLX(nn)=x(ii,jj);
            ii=ii+1;
        end

        ii=(i-1)*4+1;
        jj=(j-1)*4+1+2;

        for k=11:15
            nn=i0+k;
            GLLX(nn)=x(ii,jj);
            ii=ii+1;
        end

        ii=(i-1)*4+1;
        jj=(j-1)*4+1+3;

        for k=16:20
            nn=i0+k;
            GLLX(nn)=x(ii,jj);
            ii=ii+1;
        end

        ii=(i-1)*4+1;
        jj=(j-1)*4+1+4;

        for k=21:25
            nn=i0+k;
            GLLX(nn)=x(ii,jj);
            ii=ii+1;
        end
    end
end

GLLX1=GLLX;

% return;

x=x1;
for j=1:30
    for i=1:90

        i0=(j-1)*90*25+(i-1)*25;

        ii=(i-1)*4+1;
        jj=(j-1)*4+1;

        for k=1:5
            nn=i0+k;
            GLLX(nn)=x(ii,jj);
            ii=ii+1;
        end

        ii=(i-1)*4+1;
        jj=(j-1)*4+1+1;

        for k=6:10
            nn=i0+k;
            GLLX(nn)=x(ii,jj);
            ii=ii+1;
        end

        ii=(i-1)*4+1;
        jj=(j-1)*4+1+2;

        for k=11:15
            nn=i0+k;
            GLLX(nn)=x(ii,jj);
            ii=ii+1;
        end

        ii=(i-1)*4+1;
        jj=(j-1)*4+1+3;

        for k=16:20
            nn=i0+k;
            GLLX(nn)=x(ii,jj);
            ii=ii+1;
        end

        ii=(i-1)*4+1;
        jj=(j-1)*4+1+4;

        for k=21:25
            nn=i0+k;
            GLLX(nn)=x(ii,jj);
            ii=ii+1;
        end
    end
end

GLLX0=cat(1,GLLX,GLLX1);

