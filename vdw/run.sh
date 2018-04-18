#!/bin/bash
#SBATCH -J vdw
#SBATCH -p normal
#SBATCH --time=1000:00:00
#SBATCH -n 48
#SBATCH --nodelist=vega[03]

export QCSCRATCH="/scratch/jj585/vdw/"
export OMP_NUM_THREADS=4

rm $QCSCRATCH/* -rf 

source activate /home/fs01/jj585/usr/lib/python_envs/chempy36

# mpiexec -n 24    python    lj.py  1001   1  2  12  13
# mpiexec -n 24    python    lj.py  1101   1  2  12  13
# mpiexec -n 24    python    lj.py  1111   1  2  12  13
# mpiexec -n 24    python    lj.py  10n01  1  2  12  13
# mpiexec -n 24    python    lj.py  11n01  1  2  12  13
# mpiexec -n 24    python    lj.py  11n11  1  2  12  13

mpiexec -n 12    python    lj.py  0000   1  2  12  13
mpiexec -n 12    python    lj.py  0100   1  2  12  13
mpiexec -n 12    python    lj.py  0110   1  2  12  13
mpiexec -n 12    python    lj.py  00n00  1  2  12  13
mpiexec -n 12    python    lj.py  01n00  1  2  12  13
mpiexec -n 12    python    lj.py  01n10  1  2  12  13
