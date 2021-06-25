# setup
Tools for setting up remote jupyter servers in AWS ubuntu instances

Overly simplified version of [fastsetup](https://github.com/fastai/fastsetup)

## Steps
0. `ssh -L localhost:8888:localhost:8888 ubuntu@<ip_address>` --> to be able to connect to jupter server from browser, or `ssh ubuntu@<ip_address>` if not using jupyter

1. Installing mamba and other basic stuff: 
  - `wget https://raw.githubusercontent.com/Space-Intelligence/setup/main/setup.sh`
  - `. ./setup.sh`. 
    > If not using a gpu server set `-g false`.
    > If using cpu optimized machine set `-c true`

2. Reboot and install nvidia drivers (if using GPU instance)
  - `ubuntu-drivers devices` --> select appropriate driver from the list for next step:
  - `sudo apt install -y nvidia-driver-460-server`
  - `sudo modprobe nvidia`
  - `nvidia-smi`

-- if connection error when creating jupyter server, reboot instance and try again
