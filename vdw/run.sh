export QCSCRATCH="/scratch/jj585/vdw/"
export OMP_NUM_THREADS=12

rm $QCSCRATCH/* -rf 

source activate /home/fs01/jj585/usr/lib/python_envs/chempy36

mpiexec -n 1    python    lj.py  11n11  1  2  12  13
