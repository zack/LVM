/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 */

'use strict';

module.exports = function(statusCodes, logging) {
    var is400Status = function(status){
        return (statusCodes.BAD_REQUEST_STATUS <= status) && (status <= statusCodes.HIGHEST_400_RANGE_STATUS);
    };

    return {
        //server side catch all error handler logs to server and sends error message to client
        catchAllErrorHandler: function (err, req, res, next) {
            var status = err.status || 500,
                logFunction = is400Status(status) ? 'warn' : 'error';

            logging[logFunction](
                'An error occurred.',
                {
                    application: 'lvm',
                    error: err.toString(),
                    developerMessage: err.developerMessage,
                    status: status,
                    stack: err.stack,
                    url: req.url
                }
            );

            // include the timestamp as it can be used to trace things back from the log output from log_errors
            var errorToSend = {'status': 'error', 'serverTimestamp': new Date().toString(), 'message': err.message};

            if(err.updatedItem){
                errorToSend.updatedItem = err.updatedItem;
            }

            res.status(status).json(errorToSend);
        }
    };
};



