local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "CSS and JavaScript",
comments: "Override the default caching behavior for CSS and JavaScript",
criteria: [
papi.criteria.fileExtension {
  "matchCaseSensitive": false,
  "matchOperator": "IS_ONE_OF",
  "values": [
    "css",
    "js"
  ]
},
],
criteriaMustSatisfy: "any",
behaviors: [
papi.behaviors.caching {
  "behavior": "MAX_AGE",
  "mustRevalidate": false,
  "ttl": "7d"
},
],
}
