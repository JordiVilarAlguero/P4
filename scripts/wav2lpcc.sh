#!/bin/bash

# Make pipeline return code the last non-zero one or zero if all the commands return zero.
set -o pipefail

## \file
## \TODO This file implements a very trivial feature extraction; use it as a template for other front ends.
## 
## Please, read SPTK documentation and some papers in order to implement more advanced front ends.

# Base name for temporary files
base=/tmp/$(basename $0).$$ 

# Ensure cleanup of temporary files on exit
trap cleanup EXIT
cleanup() {
   \rm -f $base.*
}
<<<<<<< HEAD

=======
#cambiaria esto porque cambia el orden
>>>>>>> e2b3d4f715413f50c42c558021627e00622fdfbe
if [[ $# != 3 ]]; then
   echo "$0 lpc_order input.wav output.lp"
   exit 1
fi

lpc_order=$1
inputfile=$2
outputfile=$3

UBUNTU_SPTK=1
if [[ $UBUNTU_SPTK == 1 ]]; then
   # In case you install SPTK using debian package (apt-get)
   X2X="sptk x2x"
   FRAME="sptk frame"
   WINDOW="sptk window"
   LPC="sptk lpc"
else
   # or install SPTK building it from its source
   X2X="x2x"
   FRAME="frame"
   WINDOW="window"
   LPC="lpc"
fi

# Main command for feature extration
sox $inputfile -t raw -e signed -b 16 - | $X2X +sf | $FRAME -l 240 -p 80 | $WINDOW -l 240 -L 240 |
	$LPC -l 240 -m $lpc_order > $base.lp || exit 1
   

# Our array files need a header with the number of cols and rows:
<<<<<<< HEAD
ncol=$((lpc_order + 1)) # lpc p =>  (gain a1 a2 ... ap) 
=======
ncol=$((lpc_order + 1)) # lpc p =>  (gain a1 a2 ... ap) tambien cambiara en las otras
>>>>>>> e2b3d4f715413f50c42c558021627e00622fdfbe
nrow=$(($($X2X +fa < $base.lp | wc -l) / ncol))

# Build fmatrix file by placing nrow and ncol in front, and the data after them
echo $nrow $ncol | $X2X +aI > $outputfile
cat $base.lp >> $outputfile
