local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "PUT",
comments: "Allow use of the PUT HTTP request method.",
behaviors: [
papi.behaviors.allowPut {
  "enabled": false
},
],
}
