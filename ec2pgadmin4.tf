provider "aws" {
  region = "eu-central-1"
  profile = "004326122988_cetdemo_sandbox_caws_PowerUser"
}

resource "aws_instance" "ec2" {
  ami                    = "ami-03cceb19496c25679"
  iam_instance_profile   = "ec2-ecr-admin_profile" 
  instance_type          = "t2.micro"
  subnet_id              = "subnet-071f9951d322eedc3"
  associate_public_ip_address = "true"
  key_name               = "bh67"
  
user_data = <<EOF
#! /bin/bash
echo "I was here">/var/tmp/greetings.txt
sudo yum -y update  >>/var/tmp/yum.update 2>&1
sudo yum -y install docker git
newgrp docker
sudo usermod -a -G docker $USER
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo dnf update
sudo dnf install postgresql15.x86_64 postgresql15-server -y >>/var/tmp/yum.update 2>&1
sudo su - -c 'su - ec2-user -c "git clone https://github.com/Bh67tablet/pgadmin4.git"' >>/var/tmp/yum.update 2>&1
sudo su - -c 'su - ec2-user -c /home/ec2-user/pgadmin4/pgadmin4docker.sh' >>/var/tmp/ansiuser.log 2>&1
EOF

  tags = {
    Terraform       = "true"
    Environment     = "SANDBOX"
    ManagedBy       = "firstname.lastname@vodafone.com"
    SecurityZone    = "I-A"
    Project         = "Sandbox"
    Confidentiality = "C2"
    TaggingVersion  = "V2.4"
    Name            = "pgadmin4"
  }
  
  root_block_device {
    tags = {
    Terraform       = "true"
    Environment     = "SANDBOX"
    ManagedBy       = "firstname.lastname@vodafone.com"
    SecurityZone    = "I-A"
    Project         = "Sandbox"
    Confidentiality = "C2"
    TaggingVersion  = "V2.4"
    Name            = "pgadmin4"
    }
  }
  vpc_security_group_ids = [ aws_security_group.security_group_1.id ]
  depends_on = [ aws_security_group.security_group_1 ]
}
