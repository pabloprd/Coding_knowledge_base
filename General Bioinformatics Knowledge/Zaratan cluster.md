USING THE ZARATAN COMPUTER CLUSTER

to access the cluster I need to use this command:
ssh -l USSERNAME login.zaratan.umd.edu

#To load packages and whatnot:
module load



#activating python within the ssh cluster

module load python

create python3 -m venv myenv

activate myenv/bin/activate

deactivate

#let me know the versions and stuff

module avail (fastqc, python, etc)

#Downloading SRA files/the SRA tools package

#wget command to download stuff:
wget (https:// whatever website you're trying to get)

#tar unzip the files
tar -xvzf (file)

#modify path:
nano ~/.bashrc

'At the end of that file type in export path for the file example: '
export PATH=$PATH:/home/yourusername/sratoolkit.3.0.6-ubuntu64/bin
 
#Then restart and and run again


#DOWNLOADING SRR STUFF
Create text accession file

then to loop through that accession file:

while read accession; do
  prefetch $accession
done < SRR_Acc_list.txt







