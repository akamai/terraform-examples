local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "HTML pages",
comments: "Override the default caching behavior for HTML pages cached on edge servers.",
criteria: [
papi.criteria.fileExtension {
  "matchCaseSensitive": false,
  "matchOperator": "IS_ONE_OF",
  "values": [
    "html",
    "htm",
    "php",
    "jsp",
    "aspx",
    "EMPTY_STRING"
  ]
},
],
behaviors: [
papi.behaviors.caching {
  "behavior": "NO_STORE"
},
papi.behaviors.cacheKeyQueryParams {
  "behavior": "IGNORE",
  "exactMatch": true,
  "parameters": [
    "gclid",
    "fbclid",
    "utm_source",
    "utm_campaign",
    "utm_medium",
    "utm_content"
  ]
},
],
}
