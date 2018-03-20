function y1 = GLL2REGU(GLLX)

for j=1:30
    for i=1:90
 
        i0=(j-1)*90*25+(i-1)*25;
        
        ii=(i-1)*4+1;
        jj=(j-1)*4+1;
        
        for k=1:5
            nn=i0+k;
            y1(ii,jj)=GLLX(nn);
            ii=ii+1;
        end
        
        ii=(i-1)*4+1;
        jj=(j-1)*4+1+1;
         
        for k=6:10
            nn=i0+k;
            y1(ii,jj)=GLLX(nn);
            ii=ii+1;
        end
        
        ii=(i-1)*4+1;
        jj=(j-1)*4+1+2;
        
        for k=11:15
            nn=i0+k;
            y1(ii,jj)=GLLX(nn);
            ii=ii+1;
        end
        
        ii=(i-1)*4+1;
        jj=(j-1)*4+1+3;
        
        for k=16:20
            nn=i0+k;
            y1(ii,jj)=GLLX(nn);
            ii=ii+1;
        end
        
        ii=(i-1)*4+1;
        jj=(j-1)*4+1+4;
        
        for k=21:25
            nn=i0+k;
            y1(ii,jj)=GLLX(nn);
            ii=ii+1;
        end
    end
end