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
'
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
'






