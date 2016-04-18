# Environment Variables
export NODE_ENV=production
export APP_NAME="lvm-production"

# Stop and delete the old app
if pm2 list | grep "lvm-production "; then pm2 stop $APP_NAME && pm2 delete $APP_NAME; fi

# Start the new app
pm2 start ./app/index.js -f -i 2 --name $APP_NAME

# Exit with success
exit 0
