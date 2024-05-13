#!/bin/bash

ROOTFS=rootfs
RIMAGE=initramfs.cpio.gz
if [ $# -gt 0 ]; then
 ROOTFS=$1
fi
if [ $# -gt 1 ]; then
 RIMAGE=$2
fi

if [ ! -d $ROOTFS ]; then
 sudo tar xzf $ROOTFS.tar.gz -C .
 sudo chown -R $USER $ROOTFS
fi

cat > $ROOTFS/buildinfo <<EOF
Build Date:  $(date +%Y/%m/%d-%T)
Build Path:  $(pwd)
Build Tool:  $(gcc --version | grep ^gcc)

EOF


cd $ROOTFS
find . -print | cpio -co | gzip -9 -c > ../iso/$RIMAGE
cd -
gzip -l iso/$RIMAGE
echo

