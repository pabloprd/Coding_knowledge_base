# QUICK TOOL WORKFLOWS

## SRA

- if all sra files in one folder:

      for file in /path/to/sra_files/*.sra; do
          fasterq-dump "$file" --outdir /path/to/fastq_output --split-files --threads 8
      done

- if all sra files in different folders that are all within the same folder (common)

      # Loop through each SRA file in the subfolders and convert to FASTQ
      find . -type f -name "*.sra" | while read srafile; do
          fasterq-dump "$srafile" --outdir /path/to/fastq_output --split-files --threads 8
      done
