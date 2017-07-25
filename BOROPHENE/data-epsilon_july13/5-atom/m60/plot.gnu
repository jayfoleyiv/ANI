#!/Users/jay/gnuplot/bin/gnuplot

set terminal postscript enhanced color 'Helvetica' 20

set xlabel 'Wavelength (nm)'
set ylabel '% Absorbance'
set output 'Absorbance_vs_WL.eps'
plot 'TMM_7Angstrom_5Atom_m60_x.txt' u 2:5 w l lw 4 title 'X', \
'TMM_7Angstrom_5Atom_m60_y.txt' u 2:5 w l lw 4 title 'Y'

set ylabel '% Reflectance'
set output 'Ref_vs_WL.eps'
plot 'TMM_7Angstrom_5Atom_m60_x.txt' u 2:3 w l lw 4 title 'X', \
'TMM_7Angstrom_5Atom_m60_y.txt' u 2:3 w l lw 4 title 'Y'

set key bottom right
set ylabel '% Transmittance'
set output 'Trans_vs_WL.eps'
plot 'TMM_7Angstrom_5Atom_m60_x.txt' u 2:4 w l lw 4 title 'X', \
'TMM_7Angstrom_5Atom_m60_y.txt' u 2:4 w l lw 4 title 'Y'

set key top right
set xrange [0:10]
set xlabel 'Energy (eV)'
set ylabel '% Absorbance'
set output 'Absorbance_vs_Energy.eps'
plot 'TMM_7Angstrom_5Atom_m60_x.txt' u 1:5 w l lw 4 title 'X', \
'TMM_7Angstrom_5Atom_m60_y.txt' u 1:5 w l lw 4 title 'Y'

set ylabel '% Reflectance'
set output 'Ref_vs_Energy.eps'
plot 'TMM_7Angstrom_5Atom_m60_x.txt' u 1:3 w l lw 4 title 'X', \
'TMM_7Angstrom_5Atom_m60_y.txt' u 1:3 w l lw 4 title 'Y'

set key bottom right
set ylabel '% Transmittance'
set output 'Trans_vs_Energy.eps'
plot 'TMM_7Angstrom_5Atom_m60_x.txt' u 1:4 w l lw 4 title 'X', \
'TMM_7Angstrom_5Atom_m60_y.txt' u 1:4 w l lw 4 title 'Y'


