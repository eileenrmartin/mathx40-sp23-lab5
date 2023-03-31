#!/bin/bash
#SBATCH -N 1 
#SBATCH --ntasks-per-node=8
#SBATCH -t 00:01:00

#Record the node that we ran on
echo "Job ran on: $SLURM_NODELIST"

#Load module for mpi (assuming gcc loaded)
module load mpi/openmpi/gcc/4.1.1

#Build code
mpicc -o test test.c serialVector.c parallelVector.c -lm

#Run code with a few different numbers of processors
echo "$( date ): Start loop"
for np in 1 2 4 8; do
	echo "-----------------------------------"
	echo "Run test with $np processes"
	mpirun -np $np ./test
	echo  "----------------------------------"
done
echo  "$( date ): End loop"
