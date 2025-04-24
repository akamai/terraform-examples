local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "HSTS",
comments: "Require all browsers to connect to your site using HTTPS.",
behaviors: [
papi.behaviors.httpStrictTransportSecurity {
  "enable": false
},
],
}
