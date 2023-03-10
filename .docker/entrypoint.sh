#!/bin/bash

EXEC_PATH=$(dirname $(readlink -f "$0"))
PYTHON_DIST_PACKAGES_PATH=/usr/local/lib/python3.9/dist-packages
PYTHON_LAYER_DIST_PACKAGES_PATH=./python

echo '/home/volume' > captcha-solver.pth
sudo cp captcha-solver.pth $PYTHON_DIST_PACKAGES_PATH

cd $EXEC_PATH/../src/library
pip3 install -r requirements.txt -t $PYTHON_LAYER_DIST_PACKAGES_PATH
echo "/home/volume/src/library/$PYTHON_LAYER_DIST_PACKAGES_PATH" > captcha-solver-library.pth
sudo cp captcha-solver-library.pth $PYTHON_DIST_PACKAGES_PATH

sudo chmod +x $EXEC_PATH/aws.sh
$EXEC_PATH/aws.sh