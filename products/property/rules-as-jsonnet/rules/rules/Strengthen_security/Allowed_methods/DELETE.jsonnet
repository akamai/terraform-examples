local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "DELETE",
comments: "Allow use of the DELETE HTTP request method.",
behaviors: [
papi.behaviors.allowDelete {
  "enabled": false
},
],
}
