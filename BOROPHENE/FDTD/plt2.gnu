#!/Users/jay/gnuplot/bin/gnuplot
set encoding iso_8859_1
set term post enhanced color eps '' 20 
#size 6.66,9.0

set output 'Ref_Inf.eps'

#set border linewidth 1
#set key spacing 1.05

#set multiplot layout 3,2
set xlabel 'Energy (eV)'

#set format y "%4.2f"
#set xrange [-3.5:5]
set yrange [0:1.2]
set ylabel 'Reflectance'

#set label 1 "CI / DZ" at graph 0.07, graph 0.9
#set label 2 "SDP / aDZ" at graph 0.07, graph 0.8
plot 'Inf_Borophene_Ref.txt' u (1240/$1):2 smooth unique w l lw 6 lt 1 lc rgb 'red' t "TMM", \
'Inf_Borophene_Ref.txt' u (1240/$1):3 smooth unique w l lw 6 lt 1 dt 2 lc rgb 'blue' t "FDTD"

set output 'Ref_100nm.eps'
plot '100nm_Borophene_Ref.txt' u (1240/$1):2 smooth unique w l lw 6 lt 1 lc rgb 'red' t "TMM", \
'100nm_Borophene_Ref.txt' u (1240/$1):3 smooth unique w l lw 6 lt 1 dt 2 lc rgb 'blue' t "FDTD"

set output 'Ref_50nm.eps'
plot '50nm_Borophene_Ref.txt' u (1240/$1):2 smooth unique w l lw 6 lt 1 lc rgb 'red' t "TMM", \
'50nm_Borophene_Ref.txt' u (1240/$1):3 smooth unique w l lw 6 lt 1 dt 2 lc rgb 'blue' t "FDTD"

set output 'Ref_20nm.eps'
plot '20nm_Borophene_Ref.txt' u (1240/$1):2 smooth unique w l lw 6 lt 1 lc rgb 'red' t "TMM", \
'20nm_Borophene_Ref.txt' u (1240/$1):3 smooth unique w l lw 6 lt 1 dt 2 lc rgb 'blue' t "FDTD"

set output 'Ref_10nm.eps'
plot '10nm_Borophene_Ref.txt' u (1240/$1):2 smooth unique w l lw 6 lt 1 lc rgb 'red' t "TMM", \
'10nm_Borophene_Ref.txt' u (1240/$1):3 smooth unique w l lw 6 lt 1 dt 2 lc rgb 'blue' t "FDTD"

set output 'Ref_1nm.eps'
plot '1nm_Borophene_Ref.txt' u (1240/$1):2 smooth unique w l lw 6 lt 1 lc rgb 'red' t "TMM", \
'1nm_Borophene_Ref.txt' u (1240/$1):3 smooth unique w l lw 6 lt 1 dt 2 lc rgb 'blue' t "FDTD"
