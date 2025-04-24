local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "Geolocation",
comments: |||
    Receive data about a user's geolocation and connection speed in a request
    header. If you change cached content based on the values of the X-Akamai-
    Edgescape request header, contact your account representative.
|||,
criteria: [
papi.criteria.requestType {
  "matchOperator": "IS",
  "value": "CLIENT_REQ"
},
],
behaviors: [
papi.behaviors.edgeScape {
  "enabled": false
},
],
}
