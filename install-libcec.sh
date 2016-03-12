#!/bin/bash
echo 
echo updating system...
echo

sudo apt-get update
echo 
echo installing tools...
echo
sudo apt-get install cmake liblockdev1-dev libudev-dev libxrandr-dev python-dev swig
echo 
echo compiling and installing platform
echo
cd
git clone https://github.com/Pulse-Eight/platform.git
mkdir platform/build
cd platform/build
cmake ..
make
sudo make install
cd
echo 
echo compiling and installing libcec
echo
git clone https://github.com/Pulse-Eight/libcec.git
mkdir libcec/build
cd libcec/build
cmake -DRPI_INCLUDE_DIR=/opt/vc/include -DRPI_LIB_DIR=/opt/vc/lib ..
make -j4
sudo make install
sudo ldconfig

