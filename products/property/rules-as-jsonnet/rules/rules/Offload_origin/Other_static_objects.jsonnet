local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "Other static objects",
comments: "Override the default caching behavior for other static objects.",
criteria: [
papi.criteria.fileExtension {
  "matchCaseSensitive": false,
  "matchOperator": "IS_ONE_OF",
  "values": [
    "aif",
    "aiff",
    "au",
    "avi",
    "bin",
    "bmp",
    "cab",
    "carb",
    "cct",
    "cdf",
    "class",
    "dcr",
    "dtd",
    "exe",
    "flv",
    "gcf",
    "gff",
    "grv",
    "hdml",
    "hqx",
    "ini",
    "mov",
    "mp3",
    "nc",
    "pct",
    "ppc",
    "pws",
    "swa",
    "swf",
    "txt",
    "vbs",
    "w32",
    "wav",
    "midi",
    "wbmp",
    "wml",
    "wmlc",
    "wmls",
    "wmlsc",
    "xsd",
    "zip",
    "pict",
    "tif",
    "tiff",
    "mid",
    "jxr",
    "jar"
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
