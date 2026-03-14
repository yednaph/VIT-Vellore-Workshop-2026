#!/bin/sh

NAME="scf_Kpoint"

for K in  2 4 6 8 10 12 14 16 18 20
do
cat > ${NAME}_${K}.in << EOF

 &control
    calculation = 'scf',
    prefix = 'silicon'
    outdir = './'
    pseudo_dir ='/home/karan/pseudos'
 /
 &system
    ibrav =  2,
    celldm(1) = 10.35,
    nat =  2,
    ntyp = 1,
    ecutwfc = 30
 /
 &electrons
    mixing_beta = 0.6
 /

ATOMIC_SPECIES
 Si 28.086  Si.pbe-n-kjpaw_psl.1.0.0.UPF

ATOMIC_POSITIONS (alat)
 Si 0.0 0.0 0.0
 Si 0.25 0.25 0.25

K_POINTS (automatic)
  $K $K $K 1 1 1

EOF


mpirun -np 8 pw.x < ${NAME}_${K}.in > ${NAME}_${K}.out
te=`grep ! ${NAME}_${K}.out | tail -1 | awk '{print $5}'`
echo "$K $te" >> KPoint_optimization.dat

done
