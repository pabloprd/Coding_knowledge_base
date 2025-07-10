# ZARATAN BASH SCRIPTS I WROTE FOR REFERENCE

##Sequence Alignment using HISAT2

    #!/bin/bash
    #SBATCH --job-name=slurm_PRJNA1169288_test.sh          # Name of your job
    #SBATCH --output=output.txt             # File to write standard output
    #SBATCH --error=error.txt               # File to write standard error
    #SBATCH --ntasks=24                     # Number of tasks (cores)
    #SBATCH --time=10:00:00                 # Maximum runtime (HH:MM:SS)
    
    # Print some job info
    echo "Job started on $(date)"
    echo "Running on $SLURM_NTASKS tasks"
    
    
    # Load any required modules
    module load gcc
    
    
    # changing path to target_directory
    
    cd PRJNA1169288_results || exit
    
    # align sequences to reference genome
    for r1 in *_1.fastq; do
      sample="${r1%_1.fastq}"
      r2="${sample}_2.fastq"
      hisat2 --phred33 --dta -x GRCh38 \
        -1 "$r1" -2 "$r2" \
        -S "${sample}.sam"
    done
    echo "Job finished on $(date)"
