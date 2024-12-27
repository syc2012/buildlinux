#!/bin/bash

KIMAGE=bzImage
RIMAGE=initramfs.cpio.gz
ISOIMAGE=mylinux.iso
if [ $# -gt 0 ]; then
 KIMAGE=$1
fi
if [ $# -gt 1 ]; then
 RIMAGE=$2
fi
if [ $# -gt 2 ]; then
 ISOIMAGE=$3
fi

cd iso

if [ ! -d boot ]; then

mkdir -p boot/grub
cat > boot/grub/grub.cfg <<EOF
set timeout=0
set default=0

insmod all_video

menuentry "My Linux (RAM disk)" {
	linux  /${KIMAGE} root=/dev/ram0 rw
	initrd /${RIMAGE}
}

EOF

fi

if [ ! -f ${KIMAGE} ];then
 echo "ERR: ${KIMAGE} not found"
 exit
fi

if [ ! -f ${RIMAGE} ];then
 echo "ERR: ${RIMAGE} not found"
 exit
fi

cd -

/usr/local/grub2/bin/grub-mkrescue -o ${ISOIMAGE} iso

echo "ISO generated -> ${ISOIMAGE}"
echo
