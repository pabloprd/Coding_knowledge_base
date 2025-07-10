# QUICK TOOL WORKFLOWS in Bash

SRA -> fastq -> 

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

  - Prepare Reference Genome Index:
  
          # Most common human genome: https://genome-idx.s3.amazonaws.com/hisat/grch38_genome.tar.gz
          hisat2-build reference.fa reference_index
  - Align singular FASTQ reads to the reference genome
    -For Single-end Reads:

            hisat2 --phred33 --dta -x reference_index -U sample.fastq -S sample.sam

    -For Paired-end Reads:
  
          hisat2 --phred33 --dta -x reference_index -1 sample_1.fastq -2 sample_2.fastq -S sample.sam
     
  - Align multiple Samples in a Loop

        for sample in $(ls *_1.fastq | sed 's/_1.fastq//'); do
          hisat2 --phred33 --dta -x reference_index \
            -1 ${sample}_1.fastq -2 ${sample}_2.fastq \
            -S ${sample}.sam
        done
    
  - Convert SAM to BAM and sort

        samtools view -bS sample.sam | samtools sort -o sample.sorted.bam

  - Summarize Alignment statistics

        hisat2 --phred33 --dta -x reference_index -1 sample_1.fastq -2 sample_2.fastq -S sample.sam --summary-file sample.summary.txt










  
