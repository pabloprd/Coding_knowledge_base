# QUICK TOOL WORKFLOWS in Bash

## SRA (if you have sra tools installed)
- To fetch all of the SRR files if you have the accession number and put them in all a .txt list:

        #Where PRJNA1169288_SRR_accession list is the accesion number list.
        prefetch --option-file PRJNA1169288_SRR_accession_list.txt
  
- if all sra files in one folder:

      for file in /path/to/sra_files/*.sra; do
          fasterq-dump "$file" --outdir /path/to/fastq_output --split-files --threads 8
      done

- if all sra files in different folders that are all within the same folder (common)

      # Loop through each SRA file in the subfolders and convert to FASTQ
      find . -type f -name "*.sra" | while read srafile; do
          fasterq-dump "$srafile" --outdir /path/to/fastq_output --split-files --threads 8
      done
