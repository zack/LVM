# Remove modules and re-install in case of a package update
rm -rf node_modules
npm install

# Run tests
npm run server-test
npm run client-test
