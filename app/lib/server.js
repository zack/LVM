/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 */

'use strict';

module.exports = function(app, config) {
    console.log('ENV PORT', process.env.NODE_PORT);
    var port = process.env.NODE_PORT || config.port;
    console.log('Actual', port);
    console.log('[express train application listening on %s]', port);
    return app.listen(port);
};