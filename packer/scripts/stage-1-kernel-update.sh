#!/bin/bash

# Install elrepo
#yum install -y http://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm
# Install new kernel
#yum --enablerepo elrepo-kernel install kernel-ml -y
# Remove older kernels (Only for demo! Not Production!)
rm -f /boot/*3.10*

# Install wget
yum install -y wget

# Get new fresh compiled kernel
cd /boot
wget https://raw.githubusercontent.com/olifka/otus-learning/master/kernel-5.8-rc7/initramfs-5.8.0-rc7.img
wget https://raw.githubusercontent.com/olifka/otus-learning/master/kernel-5.8-rc7/System.map-5.8.0-rc7
wget https://raw.githubusercontent.com/olifka/otus-learning/master/kernel-5.8-rc7/vmlinuz-5.8.0-rc7
# Update GRUB
grub2-mkconfig -o /boot/grub2/grub.cfg
grubby --set-default /boot/vmlinuz-5.8.0-rc7
echo "Grub update done."
# Reboot VM
shutdown -r now
