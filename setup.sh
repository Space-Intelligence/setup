## Setting up AWS ubuntu machines
## some bits are adapted from https://github.com/fastai/fastsetup

#setting default args
gpu=true
jupyter=true
mamba=true
#get arguments from the flags
while getopts "g:j:m:h" flag
do
  case "$flag" in
    g) gpu=${OPTARG} ;;
    j) jupyter=${OPTARG};;
    m) mamba=${OPTARG};;
    h) 
      echo "Syntax: bash ./setup.sh [-g|-j|-m]"
      echo "options:"
      echo "g    boolean flag for gpu, defaults to true"
      echo "j    boolean flag for jupyterlab, defaults to true"
      echo "m    boolean flag for mamba, defaults to true"
      ;;
    *) echo "invalid option: -$flag, call -h for help" ;;
  esac
done 
# basic housekeeping
sudo apt-get update

# install AWS cli to copy stuff from buckets
sudo apt install awscli -y

# install ubuntu-drivers to find out which nvidia drivers we need
if $gpu; then
  sudo apt install ubuntu-drivers-common -y  
fi

#  install conda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest*.sh -b
~/miniconda3/bin/conda init bash

source ~/.bashrc ## adding to bash path so you can actually do conda install stuff
rm Miniconda3-latest*.sh

# install mamba
if $mamba; then
  conda install mamba -n base -c conda-forge -y
fi

# install jupyter-lab
if $jupyter; then
  if $mamba; 
    then
      mamba install -c conda-forge jupyterlab -y
    else
      conda install -c conda-forge jupyterlab -y
  fi
fi
    

