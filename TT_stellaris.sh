#!/bin/bash

#
# This is the script for Stellaris development.
#
# It will install a specific eclipse version + certain plugins needed for building 
# ARM sw.
# It includes the CodeSourcery toolchain and Stellarisware.
#
#

TARGETDIR=$1
echo "Will Install to $TARGETDIR"

# create the target directory
if [ -d $TARGETDIR ]
then 
	echo "The target directory exists already - please specify a non-existing place"
fi
mkdir -p $TARGETDIR



# 64 bit ARM Toolchain integration + git + svn
if [ ! -f  download/arm-2011.09-69-arm-none-eabi-i686-pc-linux-gnu.tar.bz2 ]
then
	echo "Downloading arm-2011.09-69-arm-none-eabi-i686-pc-linux-gnu.tar.bz2 from local server"
	 wget http://10.165.0.48:8000/arm-2011.09-69-arm-none-eabi-i686-pc-linux-gnu.tar.bz2 -Pdownload
fi
if [ ! -f  download/arm-2011.09-69-arm-none-eabi-i686-pc-linux-gnu.tar.bz2 ]
then
	echo "Please download : arm-2011.09-69-arm-none-eabi-i686-pc-linux-gnu.tar.bz2"
	exit 1
fi

if [ ! -f  download/SW-LM3S-8264.exe ]
then
	echo "Downloading SW-LM3S-8264.exe from local server"
	 wget http://10.165.0.48:8000/SW-LM3S-8264.exe -Pdownload
fi
if [ ! -f  download/SW-LM3S-8264.exe ]
then
	echo "Please download : SW-LM3S-8264.exe"
	exit 1
fi

if [ ! -f  download/eclipse_juno_svn_arm_gdb_64.tar.gz ]
then
	echo "Downloading eclipse_juno_svn_arm_gdb_64.tar.gz from local server"
	 wget http://10.165.0.48:8000/eclipse_juno_svn_arm_gdb_64.tar.gz -Pdownload
fi
if [ ! -f download/eclipse_juno_svn_arm_gdb_64.tar.gz  ]
then
	echo "Please download : eclipse_juno_svn_arm_gdb_64.tar.gz"
	exit 1
fi


# Extract eclipse
tar xzf download/eclipse_juno_svn_arm_gdb_64.tar.gz -C $TARGETDIR

tar xf download/arm-2011.09-69-arm-none-eabi-i686-pc-linux-gnu.tar.bz2 -C $TARGETDIR

unzip download/SW-LM3S-8264.exe -d $TARGETDIR/stellarisware




