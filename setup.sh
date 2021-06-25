#! /bin/bash

## Setting up AWS ubuntu machines
## some bits are adapted from https://github.com/fastai/fastsetup

#setting default args
gpu=true #true if gpu server, false if not
#cli=false
cpu_optim=false

while [ $# -gt 0 ]; do
    case "$1" in 
        -g*|--gpu*)
            gpu="$2";;
        -c*|--cpu_optim*)
            cpu_optim="$2";;
        -h|--help)
            echo "syntax: ./instance-creation.sh [-g|--gpu|-c|--cpu_optim]"
            echo "Arguments: "
            echo "-g, --gpu          bool for gpu, defaults to true"
            echo "-c, --cpu_optim    bool for cpu optimized machines, with different ARM arch."
            exit 0 ;;
    esac
    shift
done

# basic housekeeping
sudo apt-get update

# install AWS cli to copy stuff from buckets
# if $cli; then
#   sudo apt install awscli -y
# fi

#  install conda
if $cpu_optim; then
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh
else
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
fi
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
    

