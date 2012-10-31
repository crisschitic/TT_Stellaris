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
	echo "The target directory exists already..."
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
if [ -d $TARGETDIR/eclipse ]
then 
	echo "eclipse directory exists already - skipping eclipse..."
else
tar xzf download/eclipse_juno_svn_arm_gdb_64.tar.gz -C $TARGETDIR
fi

if [ -d $TARGETDIR/arm-2011.09 ]
then 
	echo "arm toolchain directory exists already - skipping arm toolchain..."
else
	tar xf download/arm-2011.09-69-arm-none-eabi-i686-pc-linux-gnu.tar.bz2 -C $TARGETDIR
fi

if [ -d $TARGETDIR/stellarisware ]
then 
	echo "stellarisware directory exists already - skipping stellarisware..."
else
	unzip download/SW-LM3S-8264.exe -d $TARGETDIR/stellarisware
fi


echo 'installfolder='$TARGETDIR > $TARGETDIR/start_eclipse.sh
echo 'export STELLARISWARE_ROOT=$installfolder/stellarisware' >> $TARGETDIR/start_eclipse.sh
echo 'export ARMTOOLCHAIN_ROOT=$installfolder/arm-2011.09' >> $TARGETDIR/start_eclipse.sh
echo 'export PATH=$ARMTOOLCHAIN_ROOT/bin:$PATH' >> $TARGETDIR/start_eclipse.sh
echo  >> $TARGETDIR/start_eclipse.sh
echo './eclipse/eclipse --no-splash' >> $TARGETDIR/start_eclipse.sh

chmod +x $TARGETDIR/start_eclipse.sh


#currentfolder=~/testTemplates/stellaris
#
#export STELLARISWARE_ROOT=$currentfolder/stellarisware
#export ARMTOOLCHAIN_ROOT=$currentfolder/arm-2011.09

#export PATH=$ARMTOOLCHAIN_ROOT/bin:$PATH

#echo " The following variables have been set up =================="
#echo "PATH = " $PATH
#echo "ARMTOOLCHAIN_ROOT = " $ARMTOOLCHAIN_ROOT
#echo "STELLARISWARE_ROOT = " $STELLARISWARE_ROOT
#echo " ==========================================================="

#arm-none-eabi-gcc --version

#./eclipse/eclipse --no-splash'





