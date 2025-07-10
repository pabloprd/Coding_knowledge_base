# HISAT2
- Install via conda

       conda install -c bioconda hisat2
- Download using precompiled binaries

      #Download the latest HISAT2 binary (replace URL with the latest version)
      wget ftp://ftp.ccb.jhu.edu/pub/infphilo/hisat2/downloads/hisat2-2.0.4-Linux_x86_64.zip
      
      #Unzip the file
      unzip hisat2-2.0.4-Linux_x86_64.zip
      
      #Enter the directory
      cd hisat2-2.0.4
      
      #Test the installation
      ./hisat2 --help


- Building from Source:

      # Download and unzip the source
      wget https://github.com/DaehwanKimLab/hisat2/archive/refs/heads/master.zip
      unzip master.zip
      cd hisat2-master
      
      # Build with make
      make

To run from any directory remember to add to PATH

      export PATH = $PATH:/path/to/hisat2-2.0.4
