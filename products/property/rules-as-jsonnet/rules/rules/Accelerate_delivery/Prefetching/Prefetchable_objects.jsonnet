local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "Prefetchable objects",
comments: "Define which resources should be prefetched.",
criteria: [
papi.criteria.fileExtension {
  "matchCaseSensitive": false,
  "matchOperator": "IS_ONE_OF",
  "values": [
    "css",
    "js",
    "jpg",
    "jpeg",
    "jp2",
    "png",
    "gif",
    "svg",
    "svgz",
    "webp",
    "eot",
    "woff",
    "woff2",
    "otf",
    "ttf"
  ]
},
],
behaviors: [
papi.behaviors.prefetchable {
  "enabled": true
},
],
}
