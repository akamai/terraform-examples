local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "POST",
comments: "Allow use of the POST HTTP request method.",
behaviors: [
papi.behaviors.allowPost {
  "allowWithoutContentLength": false,
  "enabled": true
},
],
}
