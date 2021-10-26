#!/bin/bash
#SBATCH --job-name=dummy_job      # Job name
##SBATCH --mail-type=END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
##SBATCH --mail-user=email@ufl.edu    # Where to send mail 
##SBATCH --nodes=2                    # Run all processes on a single node	
##SBATCH --ntasks=2                   # Run a single task    
#SBATCH --cpus-per-task=4            # Number of CPU cores per task
##SBATCH --mem=1gb                    # Job memory request
#SBATCH --time=06:00:00              # Time limit hrs:min:sec
#SBATCH --output=dummy_logs/out_%A_%a.log     # Standard output and error log
##SBATCH --partition=debug
##SBATCH --nodelist=cvmfs-test-compute-0-4
##SBATCH --nodelist=cvmfs-test-compute-0-5,cvmfs-test-compute-0-6
#SBATCH --exclusive
#SBATCH --array=0-199

hostname
cd /tmp
mkdir /tmp/dir_${SLURM_JOB_ID}_${SLURM_PROCID}
cd /tmp/dir_${SLURM_JOB_ID}_${SLURM_PROCID}
gsutil cp gs://test_cmssw/457C377A-809A-1947-A600-27720ED415FB.root .
pwd
ls
cd ../
rm -rf /tmp/dir_${SLURM_JOB_ID}_${SLURM_PROCID}
#sleep 18000
