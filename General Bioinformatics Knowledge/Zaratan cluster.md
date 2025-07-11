# USING THE ZARATAN COMPUTER CLUSTER

## Accessing the cluster: 
- ssh -l USSERNAME login.zaratan.umd.edu

### MODULES
- module load
- module avail (fastqc, python, (shows different versions)


### Python within the ssh cluster
- module load python
- create python3 -m venv myenv
- activate myenv/bin/activate
- deactivate


### Downloading
- wget (https:// whatever website you're trying to get)

### Downloading SRA files/the SRA tools package
- wget online_file
- tar -xvzf (file)
- nano ~/.bashrc (To modify path)
- At the end of that file type in export path for the file example: export PATH=$PATH:/home/yourusername/sratoolkit.3.0.6-ubuntu64/bin
- Restart and run again 


### DOWNLOADING SRR STUFF
- Create text accession file
  - then to loop through that accession file:

while read accession; do
  prefetch $accession
done < SRR_Acc_list.txt

### Example Bash Script:

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

# ZARATAN sra to fastq

      #!/bin/bash
      #SBATCH --job-name=sra_to_fastq          # Name of your job
      #SBATCH --output=sra_to_fastq_output.txt             # File to write standard output
      #SBATCH --error=sra_to_fastq_errors.txt               # File to write standard error
      #SBATCH --ntasks=24                     # Number of tasks (cores)
      #SBATCH --time=010:00:00                 # Maximum runtime (HH:MM:SS)
      
      
      
      #Load any required modules
      module load gcc
      module load openjdk
      module load sratoolkit
      module load fastqc
      
      #Convert sra to fastq if the sra files are all in folders:
      find . -type f -name "*.sra" | while read srafile; do
           fasterq-dump "$srafile" --outdir  PRJNA1169288_results --split-files --threads 8
      done
      
      #Switch directories
      cd PRJNA1169288_results
      
      #quality control
      fastqc *.fastq
      
      #Let me know I'm done
      echo "done"

# ZARATAN FASTQ to SAM (Alignment)


    #!/bin/bash
    #SBATCH --job-name=test_alignment          # Name of your job
    #SBATCH --output=output.txt             # File to write standard output
    #SBATCH --error=error.txt               # File to write standard error
    #SBATCH --ntasks=24                     # Number of tasks (cores)
    #SBATCH --time=10:00:00                 # Maximum runtime (HH:MM:SS)
    #SBATCH --partition=partition_name      # (Optional) Specify partition/queue
    
    # Load any required modules
    module load sratoolkit
    
    
    # Print some job info
    echo "Job started on $(date)"
    echo "Running on $SLURM_NTASKS tasks"
    
    # align sequences to reference genome (Assuming you have paired end sequences)
    for sample in $(ls *_1.fastq | sed 's/_1.fastq//'); do
    # Put in the correct reference_index here. 
      hisat2 --phred33 --dta -x reference_index \
        -1 ${sample}_1.fastq -2 ${sample}_2.fastq \
        -S ${sample}.sam
    done
    
    
    echo "Job finished on $(date)"




# ZARATAN sam to bam


        #!/bin/bash
        #SBATCH --job-name=my_job_name          # Name of your job
        #SBATCH --output=output.txt             # File to write standard output
        #SBATCH --error=error.txt               # File to write standard error
        #SBATCH --ntasks=24                     # Number of tasks (cores)
        #SBATCH --time=01:00:00                 # Maximum runtime (HH:MM:SS)
        #SBATCH --partition=partition_name      # (Optional) Specify partition/queue
    
        # Load any required modules
        module load sratoolkit
        module load gcc
        module load samtools
    
    # Convert all SAM files in the current directory to BAM files
    for samfile in *.sam; do
      # Extract the base name (remove .sam extension)
      base="${samfile%.sam}"
      # Convert SAM to BAM
      samtools view -Sb "$samfile" > "${base}.bam"
      echo "Converted $samfile to ${base}.bam"
    done
    
    echo "Started"
    echo "Done"





