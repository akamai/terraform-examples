local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "Obfuscate backend info",
comments: |||
    Do not expose back-end information unless the request contains an additional
    secret header. Regularly change the criteria to use a specific unique value
    for the secret header.
|||,
criteria: [
papi.criteria.requestHeader {
  "headerName": "X-Akamai-Debug",
  "matchCaseSensitiveValue": true,
  "matchOperator": "IS_NOT_ONE_OF",
  "matchWildcardName": false,
  "matchWildcardValue": false,
  "values": [
    "true"
  ]
},
],
behaviors: [
papi.behaviors.modifyOutgoingResponseHeader {
  "action": "DELETE",
  "customHeaderName": "X-Powered-By",
  "standardDeleteHeaderName": "OTHER"
},
papi.behaviors.modifyOutgoingResponseHeader {
  "action": "DELETE",
  "customHeaderName": "Server",
  "standardDeleteHeaderName": "OTHER"
},
],
}
