local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "Images",
comments: "Override the default caching behavior for images.",
criteria: [
papi.criteria.fileExtension {
  "matchCaseSensitive": false,
  "matchOperator": "IS_ONE_OF",
  "values": [
    "jpg",
    "jpeg",
    "png",
    "gif",
    "webp",
    "jp2",
    "ico",
    "svg",
    "svgz"
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
