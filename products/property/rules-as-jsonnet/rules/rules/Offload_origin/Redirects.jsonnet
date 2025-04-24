local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "Redirects",
comments: |||
    Configure caching for HTTP redirects. The redirect is cached for the same
    TTL as a 200 HTTP response when this feature is enabled.
|||,
behaviors: [
papi.behaviors.cacheRedirect {
  "enabled": "false"
},
papi.behaviors.chaseRedirects {
  "enabled": false
},
],
}
