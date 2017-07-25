#!/Users/jay/gnuplot/bin/gnuplot

set terminal postscript enhanced color 'Helvetica' 25
set yrange [0:1.5] 
set xlabel 'Energy (eV)'
set ylabel 'Reflection'
set output 'Reflection_Comp.eps'
plot 'Reflection_2atom_x.txt' u (1240/$2):3 w lp pointinterval 50 lw 5 title 'R, 2-atom {/Symbol e}_{xx}', \
'Reflection_10atom_x.txt' u (1240/$2):3 w l lw 5 title 'R, 10-atom {/Symbol e}_{xx}', \
'Reflection_2atom_y.txt' u (1240/$2):3 w lp pointinterval 50 lw 5 title 'R, 2-atom {/Symbol e}_{yy}', \
'Reflection_10atom_y.txt' u (1240/$2):3 w l lw 5 title 'R, 10-atom {/Symbol e}_{yy}'

set ylabel 'Transmission'
set output 'Transmission_Comp.eps'
plot 'Reflection_2atom_x.txt' u (1240/$2):4 w lp pointinterval 50 lw 5 title 'T, 2-atom {/Symbol e}_{xx}', \
'Reflection_10atom_x.txt' u (1240/$2):4 w l lw 5 title 'T, 10-atom {/Symbol e}_{xx}', \
'Reflection_2atom_y.txt' u (1240/$2):4 w lp pointinterval 50 lw 5 title 'T, 2-atom {/Symbol e}_{yy}', \
'Reflection_10atom_y.txt' u (1240/$2):4 w l lw 5 title 'T, 10-atom {/Symbol e}_{yy}'

set ylabel 'Absorption'
set output 'Absorption_Comp.eps'
plot 'Reflection_2atom_x.txt' u (1240/$2):(1-$4-$3) w lp pointinterval 50 lw 5 title 'A, 2-atom {/Symbol e}_{xx}', \
'Reflection_10atom_x.txt' u (1240/$2):(1-$4-$3) w l lw 5 title 'A, 10-atom {/Symbol e}_{xx}', \
'Reflection_2atom_y.txt' u (1240/$2):(1-$4-$3) w lp pointinterval 50 lw 5 title 'A, 2-atom {/Symbol e}_{yy}', \
'Reflection_10atom_y.txt' u (1240/$2):(1-$4-$3) w l lw 5 title 'A, 10-atom {/Symbol e}_{yy}'





