local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "Simulate failover",
comments: |||
    Simulate an origin connection problem and test the site failover
    configuration on the CDN staging network.
|||,
criteria: [
papi.criteria.contentDeliveryNetwork {
  "matchOperator": "IS",
  "network": "STAGING"
},
papi.criteria.requestHeader {
  "headerName": "breakconnection",
  "matchCaseSensitiveValue": true,
  "matchOperator": "IS_ONE_OF",
  "matchWildcardName": false,
  "matchWildcardValue": false,
  "values": [
    "Your-Secret-Here"
  ]
},
],
behaviors: [
papi.behaviors.breakConnection {
  "enabled": true
},
],
}
