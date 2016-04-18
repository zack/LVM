# Environment Variables
export NODE_ENV=production
export APP_INSTALL_LOCATION="/app"
export APP_NAME="lvm-production"

cd $APP_INSTALL_LOCATION

# If already checked out, then pull to incorporate latest updates
if [ -d ".git" ]; then
  echo "Pulling latest code..."
  git pull origin master
else # Not checked out, clone
  echo "Cloning latest copy of repository..."
  git clone https://bitbucket.org/literacyvolunteersofma/server.git .
fi

echo "Removing old dependencies..."
rm -rf node_modules
# Reinstall all dependencies in case one changed (version-wise)
echo "Installing dependencies..."
npm install

echo "Stopping the old version of the application..."
# Stop and delete the old app
if pm2 list | grep "lvm-production "; then pm2 stop $APP_NAME && pm2 delete $APP_NAME; fi

echo "Starting the new version of the application..."
# Start the new app
pm2 start ./app/index.js -f -i 4 --name $APP_NAME

# Exit with success
echo "SUCCESS"
exit 0
