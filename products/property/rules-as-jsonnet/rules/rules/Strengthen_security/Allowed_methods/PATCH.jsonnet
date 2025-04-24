local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "PATCH",
comments: "Allow use of the PATCH HTTP request method.",
behaviors: [
papi.behaviors.allowPatch {
  "enabled": false
},
],
}
