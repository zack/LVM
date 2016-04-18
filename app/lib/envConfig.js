/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 */
 
'use strict';

/**
 * Custom env configurations. Any config that isn't managed by sysadmins should be kept here
 */
module.exports = function() {

    /* Default configurations that can be extended and override for convenience.
     * Assume "production like" configurations and override where necessary
     * for other environments.
     */
    function BaseEnvConfig() {
        return {
            logging: {
                level: 'info',
                filename: '/logs/lvm/lvm.log'
            },
            timeout: {
                time: 7000
            },
            public: {
                app_root_url : ''
            }
        };
    }

    function createDevelopmentConfiguration() {
        var scopedConfig = new BaseEnvConfig();

        scopedConfig.name = 'development';
        //scopedConfig.express_train_config_file_location = '../config';
        scopedConfig.express_train_config_file_location = '/Users/evannoyes/server/config';

        return scopedConfig;
    }

    function createProductionConfiguration() {
        var scopedConfig = new BaseEnvConfig();

        scopedConfig.name = 'production';
        scopedConfig.express_train_config_file_location = '/config/';

        return scopedConfig;
    }
    
    switch( process.env.NODE_ENV ) {
        case 'production':
            return createProductionConfiguration();
        case 'development':
            return createDevelopmentConfiguration();
        default:
            throw new Error('Unsupported environment ' + process.env.NODE_ENV);
    }
};