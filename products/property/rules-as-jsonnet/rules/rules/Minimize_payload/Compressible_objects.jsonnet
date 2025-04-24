local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "Compressible objects",
comments: "Serve gzip compressed content for text-based formats.",
criteria: [
papi.criteria.contentType {
  "matchCaseSensitive": false,
  "matchOperator": "IS_ONE_OF",
  "matchWildcard": true,
  "values": [
    "application/*javascript*",
    "application/*json*",
    "application/*xml*",
    "application/text*",
    "application/vnd-ms-fontobject",
    "application/vnd.microsoft.icon",
    "application/x-font-opentype",
    "application/x-font-truetype",
    "application/x-font-ttf",
    "font/eot*",
    "font/opentype",
    "font/otf",
    "image/svg+xml",
    "image/vnd.microsoft.icon",
    "image/x-icon",
    "text/*",
    "application/octet-stream*",
    "application/x-font-eot*",
    "font/ttf",
    "application/font-ttf",
    "application/font-sfnt",
    "application/x-tgif"
  ]
},
],
behaviors: [
papi.behaviors.gzipResponse {
  "behavior": "ALWAYS"
},
],
}
