local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "Fonts",
comments: "Override the default caching behavior for fonts.",
criteria: [
papi.criteria.fileExtension {
  "matchCaseSensitive": false,
  "matchOperator": "IS_ONE_OF",
  "values": [
    "eot",
    "woff",
    "woff2",
    "otf",
    "ttf"
  ]
},
],
criteriaMustSatisfy: "any",
behaviors: [
papi.behaviors.caching {
  "behavior": "MAX_AGE",
  "mustRevalidate": false,
  "ttl": "30d"
},
],
}
