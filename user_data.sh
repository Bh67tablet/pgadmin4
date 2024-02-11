#! /bin/bash
echo "I was here">/var/tmp/greetings.txt
sudo yum -y update  >>/var/tmp/yum.update 2>&1
sudo yum -y install docker git
sudo groupadd docker
sudo usermod -a -G docker ec2-user
newgrp docker
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo dnf update
sudo dnf install postgresql15.x86_64 postgresql15-server -y >>/var/tmp/yum.update 2>&1
sudo su - -c 'su - ec2-user -c "git clone https://github.com/Bh67tablet/pgadmin4.git"' >>/var/tmp/yum.update 2>&1
sudo su - -c 'su - ec2-user -c /home/ec2-user/pgadmin4/pgadmin4docker.sh' >>/var/tmp/ansiuser.log 2>&1
