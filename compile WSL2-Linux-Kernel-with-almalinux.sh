####compile WSL2-Linux-Kernel with almalinux
#### change to root user
sudo su

#### updating system packages and adding extra packages 
yum check-update

yum update -y

yum install epel-release -y

dnf check-update

dnf update -y

dnf install epel-release -y

yum install git bc gcc gcc-c++ make flex bison openssl-devel ncurses-devel elfutils-libelf-devel kernel-headers python3 perl dkms make tar zip xz gzip bzip2 -y

dnf install git bc gcc gcc-c++ make flex bison openssl-devel ncurses-devel elfutils-libelf-devel kernel-headers python3 perl dkms make tar zip xz gzip bzip2 -y

# kernel-devel

########################################################################
#### Download Kernel Source
cd /usr/src
#mkdir -p kernels
#cd /kernels

########################################################################
#wget https://github.com/microsoft/WSL2-Linux-Kernel/archive/refs/tags/linux-msft-wsl-5.15.90.1.tar.gz
#tar -xvzf linux-msft-wsl-5.15.90.1.tar.gz -C -d /usr/src/

## or 

#wget https://github.com/microsoft/WSL2-Linux-Kernel/archive/refs/tags/linux-msft-wsl-5.15.90.1.zip
unzip linux-msft-wsl-* -d /usr/src/

########################################################################
#### specific branch-tag clone 
#git clone --branch linux-msft-wsl-5.15.90.1 https://github.com/microsoft/WSL2-Linux-Kernel.git

## or 
#### all version huge clone 
#git clone https://github.com/microsoft/WSL2-Linux-Kernel.git 
#git checkout --branch linux-msft-wsl-5.15.y   ## branch name
#git checkout --branch linux-msft-wsl-5.15     ## version tag
#git fetch
#### specific branch clone 
#git clone --branch linux-msft-wsl-5.15.y https://github.com/microsoft/WSL2-Linux-Kernel.git
#### specific commit hash clone 
#git init
#git remote add origin https://github.com/microsoft/WSL2-Linux-Kernel.git
#git fetch origin 4aeb7776ebf6d022dfe49fc8abf4ece02d523e84
#git reset --hard FETCH_HEAD

#####################################################################
#copy the kernel source .config file to kernel dir 
cd WSL2-Linux-Kernel-*
#\cp -rv /boot/config-$(uname -r) .config
#\cp -rv ./Microsoft/config-wsl .config
#zcat /proc/config.gz > .config

#### start build 
make -j$(nproc) KCONFIG_CONFIG=Microsoft/config-wsl

#make -j$(nproc) KCONFIG_CONFIG=arch/x86/configs/config-wsl

#cp ./Microsoft/config-wsl ./arch/x86/configs/wsl_defconfig

#make -j$(nproc) KCONFIG_CONFIG=arch/x86/configs/wsl_defconfig

