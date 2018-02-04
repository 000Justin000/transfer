export OMP_NUM_THREADS=4
# psi4 -i 00_0.in -o 00_0.out -n 1
# psi4 -i 08_0.in -o 08_0.out -n 1
# psi4 -i 09_0.in -o 09_0.out -n 1
psi4 -i 10_0.in -o 10_0.out -n 4
psi4 -i 10_1.in -o 10_1.out -n 4
psi4 -i 16_0.in -o 16_0.out -n 4
psi4 -i 16_1.in -o 16_1.out -n 4
