include makefile-common

all: rootfs iso

config: kernel-config rootfs-config iso-config

clean: kernel-clean rootfs-clean iso-clean

distclean: clean kernel-distclean rootfs-distclean iso-distclean

help:
	@echo
	@echo "ARCH    = $(ARCH) ($(MACHINE_SIZE)-bit)"
	@echo "COMPILE = $(shell which $(CC))"
	@echo "KERNEL  = $(KERNEL)"
	@echo "ROOTFS  = $(ROOTFS)"
	@echo

include makefile-kernel
include makefile-rootfs
include makefile-iso

.PHONY: all config clean distclean help rootfs iso
