#! /bin/bash
sudo yum -y update  >>/var/tmp/yum.update 2>&1
sudo yum -y install git
sudo su - -c 'su - ec2-user -c "git clone https://github.com/Bh67tablet/pgadmin4.git"' >>/var/tmp/yum.update 2>&1
sudo su - -c 'su - ec2-user -c /home/ec2-user/pgadmin4/initial.sh' >>/var/tmp/yum.update 2>&1
