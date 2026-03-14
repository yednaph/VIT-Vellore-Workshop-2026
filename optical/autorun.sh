mpirun -np 8 pw.x < scf.in > scf.out
mpirun -np 8 epsilon.x < spectra.in > spectra.out
