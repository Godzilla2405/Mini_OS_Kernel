#!/bin/sh
set -e
. ./config.sh

for PROJECT in $PROJECTS; do
  echo "Cleaning $PROJECT"
  (cd $PROJECT && $MAKE clean)
done

rm -rf sysroot
rm -rf isodir
rm -rf simple_os.iso
rm -f bootable_kernel.bin
