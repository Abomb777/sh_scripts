#!/bin/bash
#lscpu | grep Virtualization
#yum install -y qemu-guest-agent
#systemctl start qemu-guest-agent
yum install qemu-kvm libvirt libvirt-python libguestfs-tools virt-install
systemctl enable libvirtd
systemctl start libvirtd

