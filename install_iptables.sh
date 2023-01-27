#!/bin/bash
sudo yum install -y iptables-services
sudo systemctl start iptables
#sudo systemctl start ip6tables
sudo systemctl enable iptables
#sudo systemctl enable ip6tables
sudo systemctl status iptables
#sudo systemctl status ip6tables