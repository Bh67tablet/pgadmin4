#! /bin/bash
echo "I was here">/var/tmp/greetings.txt
sudo yum -y update
sudo yum -y install docker git
sudo groupadd docker
sudo usermod -a -G docker ec2-user
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo dnf update
sudo dnf install postgresql15.x86_64 postgresql15-server -y
sudo su - -c 'su - ec2-user -c newgrp docker'
sudo su - -c 'su - ec2-user -c docker pull dpage/pgadmin4'
sudo su - -c 'su - ec2-user -c docker run -it --restart unless-stopped -p 5432:80 -e "PGADMIN_DEFAULT_EMAIL=bernd.hohmann@vodafone.com" -e "PGADMIN_DEFAULT_PASSWORD=SuperSecret" -d dpage/pgadmin4' 
sudo su - -c 'su - ec2-user -c "git clone https://github.com/Bh67tablet/pgadmin4.git"'
