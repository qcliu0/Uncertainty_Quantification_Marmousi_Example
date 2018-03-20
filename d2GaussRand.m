
K = fspecial('gaussian',[7 7], 0.8);

w=normrnd(0,0.4,101,101);
smooth_w=w;
for i=1:10
smooth_w=conv2(smooth_w,K,’same’);
figure;imagesc(smooth_w);colorbar;
end;