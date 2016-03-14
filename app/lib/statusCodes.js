/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 */

'use strict';

/**
 * This module contains HTTP status codes to be used throughout the entire application.
 * @returns {{VERSION_UPDATE_STATUS: number, BAD_REQUEST_STATUS: number, NOT_FOUND_STATUS: number}}
 */
module.exports = function() {
    return {
        BAD_REQUEST_STATUS: 400,
        AUTH_FAILED: 401,
        NOT_FOUND_STATUS: 404,
        METHOD_NOT_ALLOWED: 405,
        VERSION_CONFLICT_STATUS: 409,
        HIGHEST_400_RANGE_STATUS: 499,
        INTERNAL_SERVER_ERROR: 500
    };
};