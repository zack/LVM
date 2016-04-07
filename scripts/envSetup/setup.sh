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