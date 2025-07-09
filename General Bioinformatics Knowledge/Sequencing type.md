# Sequencing types:

**Sanger Sequencing**  
This is an older, highly accurate method that sequences one DNA fragment at a time. It’s not directly comparable to next-generation sequencing (NGS) data because it produces much less data 
and is usually used for validating results from other methods, not for large-scale analysis.

**Fragment Analysis**  
This isn’t actually sequencing. Instead, it measures the size of DNA fragments, often for genotyping. Since it doesn’t provide sequence information, it can’t be compared to sequencing data.

**Next-Generation Sequencing (NGS)**  
This refers to high-throughput methods that can sequence millions of DNA fragments at once. NGS includes several subtypes:

- **Whole Genome Sequencing (WGS):** Sequences the entire genome. WGS data can be compared to other WGS data, but not directly to exome or targeted sequencing.

- **Whole Exome Sequencing (WES):** Sequences only the coding regions (exons) of the genome. WES data can be compared to other WES data, but not to WGS or targeted sequencing.

- **Targeted Sequencing:** Focuses on specific genes or regions. It’s only comparable to other targeted sequencing data if the same regions are sequenced.

**RNA Sequencing (RNA-seq)**  
This sequences RNA to study gene expression. It’s only comparable to other RNA-seq data, and not to DNA sequencing (like WGS or WES).

- **Whole Transcriptome RNA-seq (total RNA-seq): captures all RNA species in a sample including both coding and noncoding RNAs
  - Useful for discovery of novel transcript and comprehensive expression profiling
  - Comparable to other whole transcriptome datsets, but not directly to targeted or small RNA-seq

- **mRNA-seq: Focuses on messenger RNA by selecting poly(A) RNA
  - Used for gene expression analysis of protein-coding genes
  - Comparable to other mRNA-seq datasets, but not to total RNA or small RNA-seq, since noncoding RNAs are not included 

- **smRNA-seq** Specifically isolates and sequences small RNAs (like miRNA, siRNA, piRNA)
  - Used to study regulatory small RNAs
  - Only comparable to other small RNA-seq datasets not to mRNA or total RNA-seq because it targets a different size and type of RNA

- **Targeted RNA-seq** Only comparable if the same targets are sequenced

- **Strand-specific** RNA-seq: Retains information about which DNA strand the RNA was transcribed from
  - Useful for distinguishing overlapping genes and detecting antisense transcripts
  - Comparable to other strand-specific datasets; can be applied to both total RNA and mRNA-seq

- **Direct RNA-seq and Long-read RNA-seq**:
  - Sequences native RNA molecules directly or generates long reads from cDNA
  - Useful for full-length transcript detection and studying RNA modifications
  - Comparable to other long-read or direct RNA-seq datasets, but not directly to short-read RNA-seq due to differences in read lengths and error profiles. 

**Single-cell RNA sequencing**: Powerful approach for measuring gene expression at the individual cell level

**Long-Read Sequencing (PacBio, Oxford Nanopore, etc.)**  
These technologies produce much longer reads than typical NGS (like Illumina). Long-read data can be compared to other long-read data, but not directly to short-read
NGS data because of differences in error rates and read lengths.

**Single Molecule Sequencing**  
This is a type of long-read sequencing that reads individual DNA molecules. It’s comparable to other single-molecule or long-read data, but not to short-read NGS.
