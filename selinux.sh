sed -i 's/\s*SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config
sudo shutdown -r now
