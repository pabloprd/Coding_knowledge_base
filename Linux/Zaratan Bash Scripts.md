# ZARATAN BASH SCRIPTS I WROTE FOR REFERENCE

    #!/bin/bash
    #SBATCH --job-name=my_job_name          # Name of your job
    #SBATCH --output=output.txt             # File to write standard output
    #SBATCH --error=error.txt               # File to write standard error
    #SBATCH --ntasks=24                     # Number of tasks (cores)
    #SBATCH --time=01:00:00                 # Maximum runtime (HH:MM:SS)
    #SBATCH --partition=partition_name      # (Optional) Specify partition/queue
    
    # Load any required modules
    module load sratoolkit
    
    # Move to the directory where you submitted the job
    cd $SLURM_SUBMIT_DIR
    
    # Print some job info
    echo "Job started on $(date)"
    echo "Running on $SLURM_NTASKS tasks"
    
    # Example: Download SRA files listed in a file
    prefetch --option-file PRJNA1169288_SRR_accession_list.txt -O /scratch/$USER/sra
    
    # Example: Convert SRA to FASTQ (parallelized if desired)
    for acc in $(cat PRJNA1169288_SRR_accession_list.txt); do
        fasterq-dump /scratch/$USER/sra/$acc/$acc.sra --outdir /scratch/$USER/fastq
    done
    
    echo "Job finished on $(date)"
