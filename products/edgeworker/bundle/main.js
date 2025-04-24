/*
(c) Copyright 2020 Akamai Technologies, Inc. Licensed under Apache 2 license.
Version: 0.2
Purpose:  EdgeWorker that adds a response header
*/

import { logger } from 'log';

export function onClientResponse (request, response) {
  logger.log('Adding a header in ClientResponse');
  response.setHeader('X-Hello-World', 'From Akamai EdgeWorkers');
}
