local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "OPTIONS",
comments: "Allow use of the OPTIONS HTTP request method.",
behaviors: [
papi.behaviors.allowOptions {
  "enabled": true
},
],
}
