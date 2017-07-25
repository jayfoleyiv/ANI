#!/Users/jay/gnuplot/bin/gnuplot

set terminal postscript enhanced color 'Helvetica' 25
#set yrange [0:1.5] 
#set xrange [0:50000]
set xlabel 'x (nm)'
set ylabel '|E(x,{/Symbol l}=652nm)|^2'
set output 'E2_652.eps'

plot 'E2_SemInf_652nm.txt' u ($1*-1):2 w l lw 3 title 'Semi-infinte', \
'E2_100nm_653nm.txt' u ($1*-1):2 w l lw 3 title '100 nm', \
'E2_50nm_652nm.txt' u ($1*-1):2 w l lw 3 title '50 nm', \
'E2_20nm_652nm.txt' u ($1*-1):2 w l lw 3 title '20 nm', \
'E2_10nm_652nm.txt' u ($1*-1):2 w l lw 3 title '10 nm', \
'E2_1nm_652nm.txt' u ($1*-1):2 w l lw 3 title '1 nm'


set ylabel '|E(x,{/Symbol l}=563nm)|^2'
set output 'E2_563.eps'

plot 'E2_SemiInf_563nm.txt' u ($1*-1):2 w l lw 3 title 'Semi-infinte', \
'E2_100nm_563nm.txt' u ($1*-1):2 w l lw 3 title '100 nm', \
'E2_50nm_563nm.txt' u ($1*-1):2 w l lw 3 title '50 nm', \
'E2_20nm_563nm.txt' u ($1*-1):2 w l lw 3 title '20 nm', \
'E2_10nm_563nm.txt' u ($1*-1):2 w l lw 3 title '10 nm', \
'E2_1nm_563nm.txt' u ($1*-1):2 w l lw 3 title '1 nm'
