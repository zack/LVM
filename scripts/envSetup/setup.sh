echo "LVM Environment Setup Script"
echo "NODE_ENV=production" >> /etc/environment
sudo apt-get -y install build-essential
sudo apt-get install g++ curl libssl-dev apache2-utils
cd /tmp
sudo wget https://nodejs.org/dist/v5.6.0/node-v5.6.0.tar.gz
sudo tar -zxvf node-v5.6.0.tar.gz
cd node-v5.6.0.tar.gz
./configure
make
sudo make install
npm install -g npm@3.6.0
sudo apt-get install mysql-server 
snetstat –tulpn
sudo apt-get install git
sudo apt-get update
sudo apt-get install nginx
sudo update-rc.d nginx defaults
echo "server {" > /etc/nginx/sites-available/default
echo "    listen 80;" >> /etc/nginx/sites-available/default
echo "\n" >> /etc/nginx/sites-available/default
echo "    server_name cs4500.duncanbeard.com;" >> /etc/nginx/sites-available/default
echo "\n" >> /etc/nginx/sites-available/default
echo "    location / {" >> /etc/nginx/sites-available/default
echo "        proxy_pass http://127.0.0.1:8000;" >> /etc/nginx/sites-available/default
echo "        proxy_http_version 1.1;" >> /etc/nginx/sites-available/default
echo "        proxy_set_header Upgrade $http_upgrade;" >> /etc/nginx/sites-available/default
echo "        proxy_set_header Connection 'upgrade';">> /etc/nginx/sites-available/default
echo "        proxy_set_header Host $host;" >> /etc/nginx/sites-available/default
echo "        proxy_cache_bypass $http_upgrade;" >> /etc/nginx/sites-available/default
echo "    }" >> /etc/nginx/sites-available/default
echo "}" >> /etc/nginx/sites-available/default
sudo service nginx restart