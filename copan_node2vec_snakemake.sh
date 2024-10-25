#!/bin/bash
#
#SBATCH --job-name=copanmake
#SBATCH --output=workflow/out/job_out/copanmake_%j.out  # Standard output
#SBATCH --error=workflow/out/job_out/copanmake_%j.err    # Standard error
#SBATCH --time=48:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --mem=20G
#SBATCH --account pmg

source /burg/pmg/users/korem_lab/miniforge3/etc/profile.d/conda.sh  # Ensures conda is available in the script
conda activate snakemake

cd /burg/pmg/users/rc3710/CopanTopologyAnalysis

snakemake --unlock
snakemake -c 2 -j 2 --rerun-incomplete --keep-going
