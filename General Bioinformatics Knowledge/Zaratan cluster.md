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







