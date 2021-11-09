// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

import { success } from '../packs/coordinates';
//import { coordsArray } from '../packs/coordinates_array';
