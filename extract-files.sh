#!/bin/sh
MANU=samsung
DEV=espressowifi
VEND=../../../vendor

rm -rf $VEND/$MANU/$DEV

for FLS in `cat proprietary-files.txt`; do
    DIR=`dirname $FLS`
    FILE=`echo "${FLS##*/}"`
    adb pull /system/$FLS $VEND/$MANU/$DEV/proprietary/$FILE
done

./setup-makefiles.sh
