set term png size 1200,400

set output "image_rho_kappa_mu_kernels.png"

set palette defined ( 0 "blue", 0.5 "yellow", 1 "red")
set pm3d map
unset xtics
unset ytics
unset key
unset grid
set samples 5

set isosamples 5

set multiplot

set size 0.333,1
set origin 0,0
set title "rho"
splot "./proc000000_rho_kappa_mu_kernel.dat" using 1:2:3 w points palette pt 7 ps 0.5

set size 0.333,1
set origin 0.33,0
set title "eigenvector vp"
splot "./proc000000_rho_kappa_mu_kernel.dat" using 1:2:4 w points palette pt 7 ps 0.5

set size 0.333,1
set origin 0.64,0
set title "eigenvector vs"
splot "./proc000000_rho_kappa_mu_kernel.dat" using 1:2:5 w points palette pt 7 ps 0.5

unset multiplot


