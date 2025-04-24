local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "Obfuscate debug info",
comments: |||
    Do not expose back-end information unless the request contains the Pragma
    debug header.
|||,
behaviors: [
papi.behaviors.cacheTagVisible {
  "behavior": "PRAGMA_HEADER"
},
],
}
