/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 */

'use strict';

module.exports = function(app, config) {
    console.log('[express train application listening on %s]', config.port);
    return app.listen(config.port);
};