# Building

* Run the build-test.sh script
* This installs all dependencies from scratch (in case of a version change)
* It will also remove any residual view files
* It will then proceed to run the app tests as well

# Launching
* On the development host, run either the dev-development.sh or dev-production.sh script depending on the config file you wish to use
* On the actual production host, run the lvm-production.sh script
* These scripts should only be run after the build-test.sh script

# Database Test Data
* Run the dev-reset-db-test-data.sh script
* The host will need to be manually updated to the new intended target database