# Sequence alignment workflow

SRA -> fastq -> .Sam -> R
## Overview:



## Downloading SRA (if you have sra tools installed)
- To fetch all of the SRR files if you have the accession number and put them in all a .txt list:

        #Where PRJNA1169288_SRR_accession list is the accesion number list.
        prefetch --option-file PRJNA1169288_SRR_accession_list.txt

### Converting to FASTQ  
- if all sra files in one folder:

      for file in /path/to/sra_files/*.sra; do
          fasterq-dump "$file" --outdir /path/to/fastq_output --split-files --threads 8
      done

- if all sra files in different folders that are all within the same folder (common)

      # Loop through each SRA file in the subfolders and convert to FASTQ
      find . -type f -name "*.sra" | while read srafile; do
          fasterq-dump "$srafile" --outdir /path/to/fastq_output --split-files --threads 8
      done

- Quality control of fastqc files

        #Assuming they are all in the same directory        
        fastqc *.fastq
  
- Quantify reads (total counts):: Used for quick checks, no references, library prep assessments etc.
  Non-robust counts:

        # For single-end:
        grep -c "^+$" sample.fastq
        
        # For paired-end (sum both files):
        grep -c "^+$" sample_1.fastq
        grep -c "^+$" sample_2.fastq

  Robust counts (Each read is 4 lines in fastq)

        # Single-end:
        expr $(wc -l < sample.fastq) / 4
        
        # Paired-end:
        expr $(wc -l < sample_1.fastq) / 4
        expr $(wc -l < sample_2.fastq) / 4

### Aligning with HISAT2
- Gene/Transcript-level counts (Important for R data analysis)
        Reference genome Indices: https://daehwankimlab.github.io/hisat2/download/
        genome_snp: For variant-aware alignment
        genome_tran: For transcriptome-aware alignment, e.g. improved spliced alignment in RNA-seq
        genome_snp_tran: For both SNP and transcriptome-aware alignment

- Downloading NCBI programs to programmaticaly download genome sequences and related data from the NCBI datasets platform

        wget -O datasets 'https://ftp.ncbi.nlm.nih.gov/pub/datasets/command-line/v2/linux-amd64/datasets'
        wget -O dataformat 'https://ftp.ncbi.nlm.nih.gov/pub/datasets/command-line/v2/linux-amd64/dataformat'
        chmod +x datasets dataformat

- Downloading the GRCh38

         ./datasets download genome accession GCF_000001405.26 --filename GRCh38_dataset.zip


- Unzip the downloaded package

          unzip GRCh38_dataset.zip







  
