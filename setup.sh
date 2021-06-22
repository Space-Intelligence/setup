## Setting up AWS ubuntu machines
## some bits are adapted from https://github.com/fastai/fastsetup

#setting default args
gpu=true #true if gpu server, false if not
cli=false

#get arguments from the flags
while getopts "g:c:h" flag
do
  case "$flag" in
    g) gpu=${OPTARG} ;;
    c) cli=${OPTARG};;
    h) 
      echo "Syntax: bash ./setup.sh [-g|-c|-m]"
      echo "options:"
      echo "g    boolean flag for gpu server. Controls the installation of nvidia drivers and jupyter"
      echo "c    boolean flag for aws cli. Defaults to false"
      ;;
    *) echo "invalid option: -$flag, call -h for help" ;;
  esac
done 
# basic housekeeping
sudo apt-get update

# install AWS cli to copy stuff from buckets
if $cli; then
  sudo apt install awscli -y
fi

#  install conda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest*.sh -b
~/miniconda3/bin/conda init bash

source ~/.bashrc ## adding to bash path so you can actually do conda install stuff
rm Miniconda3-latest*.sh


if $gpu; then
  # install jupyter-lab
  conda install -c conda-forge jupyterlab -y
  # install ubuntu-drivers so we can find the proper drivers later
  sudo apt install ubuntu-drivers-common -y 
fi
    

