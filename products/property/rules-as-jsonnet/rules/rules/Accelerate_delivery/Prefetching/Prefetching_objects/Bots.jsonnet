local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "Bots",
comments: |||
    Disable prefetching for specific clients identifying themselves as bots and
    crawlers. This avoids requesting unnecessary resources from the origin.
|||,
criteria: [
papi.criteria.userAgent {
  "matchCaseSensitive": false,
  "matchOperator": "IS_ONE_OF",
  "matchWildcard": true,
  "values": [
    "*bot*",
    "*crawl*",
    "*spider*"
  ]
},
],
behaviors: [
papi.behaviors.prefetch {
  "enabled": false
},
],
}
