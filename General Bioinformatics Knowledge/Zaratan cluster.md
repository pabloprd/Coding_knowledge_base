Using the Zaratan supercomputer cluster

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
