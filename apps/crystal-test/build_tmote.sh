#!/bin/bash

# set to 1 for motelab testbeds
#export CFLAGS="$CFLAGS -DTINYOS_SERIAL_FRAMES=1"

# set COOJA to 1 for simulating Glossy in Cooja
#export CFLAGS="$CFLAGS -DCOOJA=1"
#export CFLAGS="$CFLAGS -DDISABLE_ETIMER=1"


CFLAGS+=" -DSINK_ID=1" 
CFLAGS+=" -DTX_POWER=31 -DCRYSTAL_CONF_DEF_CHANNEL=26 -DCONCURRENT_TXS=5 -DNUM_ACTIVE_EPOCHS=1"
CFLAGS+=" -DPAYLOAD_LENGTH=2"
CFLAGS+=" -DCRYSTAL_CONF_LOGLEVEL=CRYSTAL_LOGS_EPOCH_STATS"

CFLAGS+=" -DSTART_EPOCH=1"

export CFLAGS

echo "static uint8_t sndtbl[] = {2,3,4,5,6};" > sndtbl.c

make clean
rm crystal-teset.sky

make
rm -f sndtbl.c symbols.h symbols.c
