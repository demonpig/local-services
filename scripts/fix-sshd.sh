#!/bin/sh

sed -i '/PasswordAuthentication no/ s/no/yes/g' /etc/ssh/sshd_config
systemctl restart sshd