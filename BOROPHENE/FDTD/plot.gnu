#!/Users/jay/gnuplot/bin/gnuplot

set terminal postscript enhanced color 'Helvetica' 25
#set yrange [0:1.5] 
#set xrange [0:50000]
set xlabel 'Length (nm)'
set ylabel 'Electric Field'
set output 'E2.eps'

plot 'Reflection_x.txt' u 2:3 w l lw 5 title 'ISO, {/Symbol e}_{xx}', \
'Reflection_y.txt' u 2:3 w l lw 5 title 'ISO, {/Symbol e}_{yy}', \
'Ref_anisotropic_Test.txt' u ($1*1e9):2 w p pt 5 title 'ANISO R_{SS}', \
'Ref_anisotropic_Test.txt' u ($1*1e9):3 w p pt 7 title 'ANISO R_{PP}'

set ylabel 'Transmission'
set output 'Transmission.eps'
set pointsize 3
plot 'Reflection_x.txt' u 2:4 w l lw 5 title 'ISO, {/Symbol e}_{xx}', \
'Reflection_y.txt' u 2:4 w l lw 5 title 'ISO, {/Symbol e}_{yy}', \
'Ref_anisotropic_Test.txt' u ($1*1e9):4 w p pt 5 title 'ANISO T_{SS}', \
'Ref_anisotropic_Test.txt' u ($1*1e9):5 w p pt 7 title 'ANISO T_{PP}'

set xrange [0:500]
set ylabel 'Absorption'
set output 'Absorption.eps'
set pointsize 3
plot 'Reflection_x.txt' u 2:(1-$3-$4) w l lw 5 title 'ISO, {/Symbol e}_{xx}', \
'Reflection_y.txt' u 2:(1-$3-$4) w l lw 5 title 'ISO, {/Symbol e}_{yy}'


reset
set xrange [0:10]
set output 'Compare.eps'
set xlabel 'Energy (eV)'
plot 'Reflection_x.txt' u (1240/$2):3 w l lw 5 title '7 Ang. {/Symbol e}_{xx}', \
'Reflection_y.txt' u (1240/$2):3 w l lw 5 title '7 Ang. {/Symbol e}_{yy}', \
'Ref_x_SemiInf.txt' u (1240/$2):3 w l lw 5 title 'Inf. {/Symbol e}_{xx}', \
'Ref_y_SemiInf.txt' u (1240/$2):3 w l lw 5 title 'Inf. {/Symbol e}_{yy}'

set key top left
set output 'Vs_Energy.eps'
plot 'Reflection_x.txt' u (1240/$2):3 w l lw 5 title 'R, {/Symbol e}_{xx}', \
'Reflection_y.txt' u (1240/$2):3 w lp pointinterval 20 lw 5 title 'R, {/Symbol e}_{yy}', \
'Reflection_x.txt' u (1240/$2):4 w l lw 5 title 'T, {/Symbol e}_{xx}', \
'Reflection_y.txt' u (1240/$2):4 w lp pointinterval 20 lw 5 title 'T, {/Symbol e}_{yy}', \
'Reflection_x.txt' u (1240/$2):(1-$3-$4) w l lw 5 title 'A, {/Symbol e}_{xx}', \
'Reflection_y.txt' u (1240/$2):(1-$3-$4) w lp pointinterval 20 lw 5 title 'A, {/Symbol e}_{yy}'

