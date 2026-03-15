#!/bin/bash

# This bash script will optimize the k-points grid of 
# cubic crystals scanning from 4x4x4 to 24x24x24 grids.


rm -rf etot.dat stress.dat
for k in {2..16..2}
  do
cat > scf.in << EOF
&control
    calculation='scf'
    restart_mode='from_scratch'
    pseudo_dir = '../pseudo'
    outdir='./'
    disk_io='none'
    tstress=.true.
    tprnfor=.true.
!    etot_conv_thr=1.0d-04
!    forc_conv_thr=1.0d-03
/
&system
    ibrav=2
    celldm(1)=10.335322845 ! optimized value from previous calculation
    nat=2
    ntyp=1
    ecutwfc=80.0  ! optimized value from previous calculation
    occupations='fixed'
/
 &electrons
    conv_thr = 2.0d-8
    mixing_beta = 0.7
/
ATOMIC_SPECIES
  Si  28.085  Si.pbe-n-kjpaw_psl.1.0.0.UPF
ATOMIC_POSITIONS {crystal}
  Si  0.00    0.00  0.00
  Si  0.25    0.25  0.25
K_POINTS {automatic}
 $k $k $k 1 1 1
EOF
mpirun -np 6 pw.x <scf.in > scf.out


te=`grep ! scf.out | tail -1 | awk '{print $5}'`
#ft=`grep 'l fo' scf.out | awk '{print $4}'`
sxx=`grep -A1 'l   s' scf.out | tail -1 | awk '{print $4}'`
echo "$k  $sxx" >> stress.dat
echo "$k $te" >> etot.dat
#echo "$k  $ft" >> force.dat
mv scf.in scf$k.in
mv scf.out scf$k.out
done
