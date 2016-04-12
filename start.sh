export NODE_ENV=$@
rm -rf app/views/*.marko.js
node .
