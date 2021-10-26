#!/bin/bash
#SBATCH --job-name=test_job      # Job name
##SBATCH --mail-type=END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
##SBATCH --mail-user=email@ufl.edu    # Where to send mail 
##SBATCH --nodes=2                    # Run all processes on a single node	
#SBATCH --ntasks=2                   # Run a single task    
#SBATCH --cpus-per-task=4            # Number of CPU cores per task
##SBATCH --mem=1gb                    # Job memory request
#SBATCH --time=00:05:00              # Time limit hrs:min:sec
#SBATCH --output=out_%j_%t.log     # Standard output and error log
#SBATCH --partition=debug
##SBATCH --nodelist=cvmfs-test-compute-0-4
##SBATCH --nodelist=cvmfs-test-compute-0-5,cvmfs-test-compute-0-6
#SBATCH --exclusive

#listnodes=cvmfs-test-compute-0-5,cvmfs-test-compute-0-6

hostname
mkdir dir_${SLURM_JOB_ID}_${SLURM_PROCID}
rm -rf dir_${SLURM_JOB_ID}_${SLURM_PROCID}
ls /tmp
cd /tmp
mkdir test
ls
