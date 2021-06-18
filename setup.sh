## Setting up AWS ubuntu machines
## some bits are adapted from https://github.com/fastai/fastsetup

# basic housekeeping
sudo apt-get update

# install ubuntu-drivers to find out which nvidia drivers we need
sudo apt install ubuntu-drivers-common -y  

#  install conda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest*.sh -b
~/miniconda3/bin/conda init bash
rm Miniconda3-latest*.sh

source ~/.bashrc ## adding to bash path so you can actually do conda install stuff

# install mamba
conda install mamba -n base -c conda-forge -y

# install jupyter-lab
mamba install -c conda-forge jupyterlab -y

