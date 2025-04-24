local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "Uncacheable objects",
comments: |||
    Configure the default client caching behavior for uncacheable content at the
    edge.
|||,
criteria: [
papi.criteria.cacheability {
  "matchOperator": "IS_NOT",
  "value": "CACHEABLE"
},
],
behaviors: [
papi.behaviors.downstreamCache {
  "behavior": "BUST"
},
],
}
