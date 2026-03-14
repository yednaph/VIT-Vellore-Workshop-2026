mpirun -np 6 pw.x <scf.in> scf.out
mpirun -np 6 pw.x <bands.in> bands.out
mpirun -np 6 bands.x <bands_pp.in> bands_pp.out
mpirun -np 6 pw.x <nscf.in> nscf.out
mpirun -np 6 dos.x <dos.in> dos.out
mpirun -np 6 projwfc.x <projwfc.in> projwfc.out
sumpdos.x *\(Si\)* > atom_Si_tot.dat
sumpdos.x *\(Si\)*\(s\) > atom_Si_s.dat
sumpdos.x *\(Si\)*\(p\) > atom_Si_p.dat

