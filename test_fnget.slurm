#!/bin/bash
#SBATCH --job-name=test_job      # Job name
##SBATCH --mail-type=END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
##SBATCH --mail-user=email@ufl.edu    # Where to send mail 
#SBATCH --nodes=1                    # Run all processes on a single node	
#SBATCH --ntasks=1                   # Run a single task    
#SBATCH --cpus-per-task=4            # Number of CPU cores per task
##SBATCH --mem=1gb                    # Job memory request
#SBATCH --time=02:00:00              # Time limit hrs:min:sec
#SBATCH --array=0-3
#SBATCH --output=direct_small_arrays/out_%A_%a.log     # Standard output and error log
##SBATCH --nodelist=cvmfs-test-compute-0-7,cvmfs-test-compute-0-8,cvmfs-test-compute-0-9,cvmfs-test-compute-0-10
#SBATCH --exclusive

hostname
#sudo sed -i 's/CVMFS_HTTP_PROXY=DIRECT/CVMFS_HTTP_PROXY="35.239.44.211:3128"/g' /etc/cvmfs/default.local
#mkdir dir_${SLURM_JOB_ID}_${SLURM_PROCID}
#cd dir_${SLURM_JOB_ID}_${SLURM_PROCID}
#sudo head /etc/cvmfs/default.local
echo 'SLURM_ARRAY_JOB_ID'
echo $SLURM_ARRAY_JOB_ID
echo 'SLURM_ARRAY_TASK_COUNT'
echo $SLURM_ARRAY_TASK_COUNT
echo 'SLURM_ARRAY_TASK_ID'
echo $SLURM_ARRAY_TASK_ID
export http_proxy=http://10.0.0.11:3128
cd /tmp
~/fnget.py --url=http://cmsfrontier.cern.ch:8000/FrontierProd/Frontier --sql="select 1 from dual"
#CVMFS_HTTP_PROXY="10.0.0.16:3128"
source /cvmfs/cms.cern.ch/cmsset_default.sh
