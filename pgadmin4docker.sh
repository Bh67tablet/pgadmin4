docker pull dpage/pgadmin4
newgrp docker
docker run -p 5432:80 \
    -e "PGADMIN_DEFAULT_EMAIL=bernd.hohmann@vodafone.com" \
    -e "PGADMIN_DEFAULT_PASSWORD=SuperSecret" \
    -d dpage/pgadmin4
# install psql
