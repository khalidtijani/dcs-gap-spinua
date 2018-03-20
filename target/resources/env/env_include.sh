#!/bin/bash

# source the ciop functions (e.g. ciop-log, ciop-getparam)
source ${ciop_job_include}
# set the environment variables to use SPINUA sw and Storage Path  
export USER=khalidtijani
export STORAGE=/data/input/storage2
export SPINUA=/home/$USER/dcs-cnr-issia-spinua/spinua/bin/GAP/gap_chain_v2.0
export MAINSPINUA=/home/$USER/dcs-cnr-issia-spinua/spinua

export COMMADS=/home/$USER/dcs-cnr-issia-spinua/spinua

export PATH=/bin:/usr/local/bin:/usr/bin:$COMMADS/bin:${PATH}

# set the environment variables to use MATLAB Runtime v91 release R2016b
export MCR_ROOT=/opt/MCR_R2016b
export LD_LIBRARY_PATH=${MCR_ROOT}/v91/runtime/glnxa64:${MCR_ROOT}/v91/bin/glnxa64:${MCR_ROOT}/v91/sys/os/glnxa64:${LD_LIBRARY_PATH}

