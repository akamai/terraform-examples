local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "Offload origin",
comments: |||
    Control the settings related to caching content at the edge and in the
    browser. As a result, fewer requests go to your origin, fewer bytes leave
    your data centers, and your assets are closer to your users.
|||,
behaviors: [
papi.behaviors.caching {
  "behavior": "NO_STORE"
},
papi.behaviors.tieredDistribution {
  "enabled": true,
  "tieredDistributionMap": "CH2"
},
papi.behaviors.validateEntityTag {
  "enabled": false
},
papi.behaviors.removeVary {
  "enabled": false
},
papi.behaviors.cacheError {
  "enabled": true,
  "preserveStale": true,
  "ttl": "10s"
},
papi.behaviors.cacheKeyQueryParams {
  "behavior": "INCLUDE_ALL_ALPHABETIZE_ORDER"
},
papi.behaviors.prefreshCache {
  "enabled": true,
  "prefreshval": 90
},
papi.behaviors.downstreamCache {
  "allowBehavior": "LESSER",
  "behavior": "ALLOW",
  "sendHeaders": "CACHE_CONTROL",
  "sendPrivate": false
},
],
children: [
import 'Offload_origin/CSS_and_JavaScript.jsonnet',
import 'Offload_origin/Fonts.jsonnet',
import 'Offload_origin/Images.jsonnet',
import 'Offload_origin/Files.jsonnet',
import 'Offload_origin/Other_static_objects.jsonnet',
import 'Offload_origin/HTML_pages.jsonnet',
import 'Offload_origin/Redirects.jsonnet',
import 'Offload_origin/POST_responses.jsonnet',
import 'Offload_origin/GraphQL.jsonnet',
import 'Offload_origin/Uncacheable_objects.jsonnet',
],
}
