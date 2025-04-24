local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "Site failover",
comments: "Specify how edge servers respond when the origin is not available.",
criteria: [
papi.criteria.originTimeout {
  "matchOperator": "ORIGIN_TIMED_OUT"
},
],
criteriaMustSatisfy: "any",
behaviors: [
papi.behaviors.failAction {
  "enabled": false
},
],
}
