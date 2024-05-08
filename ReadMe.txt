1. Tools required to create ISO file

1.1 grub-mkrescue
build grub-2.06
$ ./configure --prefix=/usr/local/grub2 --exec-prefix=/usr/local/grub2 --with-platform=pc

1.2 mtools
$ sudo yum install mtools
or
$ sudo apt install mtools


2. Linux device driver for VMware

2.1 Ethernet
* AMD PCnet32 PCI support
* Intel(R) PRO/1000 Gigabit Ethernet support

2.2 SCSI disk
* BusLogic SCSI support
* LSI Logic New Generation RAID Device Drivers
* VMware PVSCSI driver support
* Fusion MPT ScsiHost drivers for SPI

