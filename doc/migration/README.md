# LVM Web Application - Migration Documentation

## Application Repository
Link: [BitBucket Literacy Volunteers Repository](https://bitbucket.org/literacyvolunteersofma/server "BitBucket Repository")

* Details about the framework and application configuration are available in the project's main README.md file

## Jenkins (Build/Continuous Integration/Deployment) Setup
1. Create a project in Jenkins by clicking "+ New Item".
2. Type the project name (ie. server) and then choose "Freestyle Project"
3. 	Project name: server
4. 	Description: Literacy Volunteers of MA Web Application
5. 	[ ] Enable project-based security
6. 	[ ] Discard Old Builds
7. 	If prompted, leave the GitBucket section blank.
8. 	Source Code Management: 
[x] Git
9. Repository URL: git@bitbucket.org:literacyvolunteersofma/server.git
10. Credentials: Need to setup an SSH key for Jenkins. Refer to [https://answers.atlassian.com/questions/85436/connecting-bitbucket-and-jenkins](https://answers.atlassian.com/questions/85436/connecting-bitbucket-and-jenkins)
11. Branch Specifier: master
12. Build Triggers:
[x] Build when a change is pushed to BitBucket
13. Build Steps:

Step 1:

```bash
# Remove modules and re-install in case of a package update
rm -rf node_modules
npm install

# Run tests
npm run server-test
npm run client-test
```
Step 2: 

```bash
# Environment Variables
export NODE_ENV=production
export APP_NAME="lvm"

# Stop and delete the old app
if pm2 list | grep "lvm "; then pm2 stop $APP_NAME && pm2 delete $APP_NAME; fi

# Start the new app
pm2 start ./app/index.js -f -i 1 --name $APP_NAME

# Exit with success
exit 0
```

14. Save the build.
15. Click 'Build Now' and the build should complete successfully.

`Note: The build files are also included in the server.tar.gz bundle for backup.`

## Environment Setup
* AWS Server Step Instructions: [Can be found here.](https://cs5500.ccs.neu.edu/confluence/pages/viewpage.action?pageId=6166464)
* Environment Setup Scripts:

``` bash
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
```

## Updating the server

* If you want to keep the server up-to-date, periodically run the following commands:

``` bash
sudo apt-get update && sudo apt-get upgrade
```