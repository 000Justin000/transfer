export OMP_NUM_THREADS=4
# psi4 -i 00_0.in -o 00_0.out -n 1
# psi4 -i 01_0.in -o 01_0.out -n 1
# psi4 -i 02_0.in -o 02_0.out -n 1
psi4 -i 03_0.in -o 03_0.out -n 4
psi4 -i 03_1.in -o 03_1.out -n 4
psi4 -i 03_2.in -o 03_2.out -n 4
psi4 -i 08\*_0.in -o 08\*_0.out -n 4
psi4 -i 08\*_1.in -o 08\*_1.out -n 4
psi4 -i 08\*_2.in -o 08\*_2.out -n 4
