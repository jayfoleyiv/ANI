#!/bin/bash
awk '{print $1, $3}' TMM_7Angstrom_2Atom_60_x.txt > r_vs_En_x.txt
awk '{print $1, $4}' TMM_7Angstrom_2Atom_60_x.txt > t_vs_En_x.txt
awk '{print $1, $5}' TMM_7Angstrom_2Atom_60_x.txt > a_vs_En_x.txt
awk '{print $1, $5}' TMM_7Angstrom_2Atom_60_y.txt > a_vs_En_y.txt
awk '{print $1, $4}' TMM_7Angstrom_2Atom_60_y.txt > t_vs_En_y.txt
awk '{print $1, $3}' TMM_7Angstrom_2Atom_60_y.txt > r_vs_En_y.txt
awk '{print $2, $3}' TMM_7Angstrom_2Atom_60_y.txt > r_vs_WL_y.txt
awk '{print $2, $4}' TMM_7Angstrom_2Atom_60_y.txt > t_vs_WL_y.txt
awk '{print $2, $5}' TMM_7Angstrom_2Atom_60_y.txt > a_vs_WL_y.txt
awk '{print $2, $5}' TMM_7Angstrom_2Atom_60_x.txt > a_vs_WL_x.txt
awk '{print $2, $4}' TMM_7Angstrom_2Atom_60_x.txt > t_vs_WL_x.txt
awk '{print $2, $3}' TMM_7Angstrom_2Atom_60_x.txt > r_vs_WL_x.txt

