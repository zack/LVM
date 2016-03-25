# Literacy Volunteers of Massachusetts Application
 
## Information
[![Build Status](http://cs4500.duncanbeard.com:8090/buildStatus/icon?job=server)](http://cs4500.duncanbeard.com:8090/job/server)
[![bitHound Overall Score](https://www.bithound.io/bitbucket/literacyvolunteersofma/server/badges/score.svg)](https://www.bithound.io/bitbucket/literacyvolunteersofma/server)
[![bitHound Dependencies](https://www.bithound.io/bitbucket/literacyvolunteersofma/server/badges/dependencies.svg)](https://www.bithound.io/bitbucket/literacyvolunteersofma/server/master/dependencies/npm)
[![bitHound Dev Dependencies](https://www.bithound.io/bitbucket/literacyvolunteersofma/server/badges/devDependencies.svg)](https://www.bithound.io/bitbucket/literacyvolunteersofma/server/master/dependencies/npm)
[![bitHound Code](https://www.bithound.io/bitbucket/literacyvolunteersofma/server/badges/code.svg)](https://www.bithound.io/bitbucket/literacyvolunteersofma/server)

Thanks to [BrowserStack](https://www.browserstack.com/) for allowing us to use their Browser Testing suite for free under the Open Source plan.

![BrowserStack Browser Testing](http://i170.photobucket.com/albums/u254/mikesta711/BrowserStack_small_zpsw0jdprbv.png "BrowserStack Open-Source Browser Testing")

* Configured Port: `8080`
	* Note: Will probably want to change to 80, or something different depending on specific implementation (ie. Nginx to host static files & Node app for API only).
* If running locally: http://127.0.0.1:8080/lvm/
* If checking on our AWS Development Environment: http://cs4500.duncanbeard.com:8080/lvm/

## Environment Setup
* Checkout the repository and change directories to it.
* Be sure to update config/default.json if you are running locally or on development.
    * The `database_url`, `database_user`, and `database_password` fields should all have values.
    * For local and development work, these will be the same as what is currently on the Confluence page (AWS Setup Information).
    * To ensure that this file is never checked in with the database username or password, run the following command: `git update-index --assume-unchanged config/default.json`
* Run `npm install`
* Set the environment:
	* Development: `export NODE_ENV=development`
	* Production: `export NODE_ENV=production`
* Start the application: `node app/index.js`

When running locally, you can just run: `./start.sh development` in the app directory.

## Framework Overview
This application uses an `express-train` framework on top of `express` for organization of application files.

* **app/** - Contains the core components of the application
	* **controllers/** - Contains the server-side controllers. Each should be a separate component.
	* **lib/** - Contains application setup files.
		* **app.js** - Sets up express and returns an instance for other components to use (ie. router for route generation)
		* **constants.js** - Server-side constants for use in multiple controllers.
		* **envConfig.js** - Environment configuration information (ie. database config file path).
		* **logging.js** - Configures application logging.
		* **middleware.js** - Configures middleware components, static file serving, sets up router, and implements application-level error handlers.
		* **routes.js** - Configure the application's routes and what function should be called should the route be hit.
		* **server.js** - Configures the server to listen on the specified port.
		* **statusCodes.js** - Constant list of status codes to be used in multiple components.
		* **views.js** - Configures application for rendering views (ie. *.hbs files). Typically used if server-side values need to be rendered into the HTML/JS for the client.
	* **middleware/**
		* **errorMiddleware.js** - Configures application level middleware to catch errors, log them, and gracefully indicate the error to the client.
	* **protected/** - Static HTML, CSS, JavaScript, etc. files to be served to the client that are protected and only accessible to users that are logged in.
	* **public/** - Static HTML, CSS, JavaScript, etc. files to be served to the client.
	* **views/** - Views to be rendered (*.hbs) for the client.
	* **index.js** - Configures express-train to be able to automatically inject app dependencies into controllers or components.
* **config/** - Local/Default configuration file location.
	* **default.json** - Default configuration file. Should be stored in a different location on Production/Development environments and will typically contain database username/password. Passwords should not be checked into the repository.
* **doc/** - Documentation directory
	* **api/** - API Documentation
* **scripts/** - Scripts directory
	* **database/** - Database scripts
	* **dataImport/** - Historical data import scripts
* **test/** - Tests
	* **server/** - Server-side tests.
	* **client/** - Client-side tests.