local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "Protocol optimizations",
comments: "Serve your website using modern and fast protocols.",
behaviors: [
papi.behaviors.enhancedAkamaiProtocol,
papi.behaviors.http2,
papi.behaviors.allowTransferEncoding {
  "enabled": true
},
papi.behaviors.sureRoute {
  "enableCustomKey": false,
  "enabled": true,
  "forceSslForward": false,
  "raceStatTtl": "30m",
  "testObjectUrl": "/akamai/testobject.html",
  "toHostStatus": "INCOMING_HH",
  "type": "PERFORMANCE"
},
],
}
