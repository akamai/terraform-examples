local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "Origin connectivity",
comments: "Optimize the connection between edge and origin.",
behaviors: [
papi.behaviors.dnsAsyncRefresh {
  "enabled": true,
  "timeout": "1h"
},
papi.behaviors.timeout {
  "value": "5s"
},
papi.behaviors.readTimeout {
  "value": "120s",
  "firstByteTimeout": "120s"
},
],
}
