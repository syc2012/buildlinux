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

if [ ! -d iso ]; then

mkdir -p iso/boot/grub
cat > iso/boot/grub/grub.cfg <<EOF
set timeout=0
set default=0

insmod all_video

menuentry "My Linux (RAM disk)" {
	linux  /${KIMAGE} root=/dev/ram0 rw console=tty0 console=ttyS0
	initrd /${RIMAGE}
}

menuentry "Reboot" {
	reboot
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


cp -f ${KIMAGE} iso/
cp -f ${RIMAGE} iso/

/usr/local/grub2/bin/grub-mkrescue -o ${ISOIMAGE} iso

rm -f iso/${KIMAGE}
rm -f iso/${RIMAGE}

echo "ISO generated -> ${ISOIMAGE}"
