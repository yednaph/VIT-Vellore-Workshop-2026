mpirun -np 8 pw.x <scf.in> scf.out
mpirun -np 8 ph.x -i ph.in > ph.out
mpirun -np 8 q2r.x -i q2r.in > q2r.out
mpirun -np 8 matdyn.x <matdyn.in> matdyn.out
plotband.x <plotband.in> plotband.out
