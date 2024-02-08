#db_host=db1.cwvfr0uoks1w.eu-central-1.rds.amazonaws.com
#psql -U postgres -p 5432 -h $1

git clone https://$user:$pat@github.vodafone.com/VFDE-CICDandCloud/CICD-Mobile_bh67.git

cd postgresDBsamples

psql -U postgres -p 5432 -h $1 -c "CREATE DATABASE \"world\";"
psql -U postgres -p 5432 -h $1 -d world < world.sql

#bernd.hohmann@E1015110 MINGW64 ~/.ssh (main)
#$ ssh -i "bh67.pem" ec2-user@ec2-35-158-209-212.eu-central-1.compute.amazonaws.com -L 5432:35.158.209.212:5432
