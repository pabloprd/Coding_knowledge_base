#May delete this later


## Docker
Docker is a platform that lets you package application and all their dependencies into "containers" so they run consistently across different environments.
These containers isolate the application from your underlying system making it easier to develop, test, and deploy software wherever.

### General process
- Installation
- Write application and a dockerfile that defines how app and dependencies should be packaged
- Build a docker image (instance)

        docker build -t my-app-image
- Run a container for your image

       docker run my-app-image
- Test and manage your container
- Push to registery/Deploy/update/
  
### Checking Docker
Docker version
docker --version

Pulling the image to my computer
Pulling an image in Docker means downloading a pre-built software package (Docker Image) to my local computer. 

docker pull biocontainers/fastqc:v0.11.9_cv8

### Make sure that the windows environment thing is set correctly
- Windows needs it to be set to wsl2 not wsl, to change this you have to:
  - wsl --update
  - wsl --set-default-version 2
  - wsl --list --verbose
  - wsl --set-version <distro_name> 2



# Pulling HISAT2

docker pull quay.io/biocontainers/hisat2:2.2.1 -- he1b5a44_2
- This commmand tells DOcker to download the HISAT2 image from the BioContainers registery on Quay


To Run HISAT2 I have to place my FASTQ files and HISAT2 index files in a folder on my computer. Then run this command:

docker run --rm -v C:\Users\yourname\hisat2_data:/data quay.io/biocontainers/hisat2:2.2.1--he1b5a44_2 \
hisat2 -x /data/genome_index_basename -1 /data/sample_R1.fastq -2 /data/sample_R2.fastq -S /data/output.sam


