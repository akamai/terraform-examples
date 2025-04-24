local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "Allowed methods",
comments: |||
    Allow the use of HTTP methods. Consider enabling additional methods under a
    path match for increased origin security.
|||,
behaviors: [
papi.behaviors.allHttpInCacheHierarchy {
  "enabled": true
},
],
children: [
import 'Allowed_methods/POST.jsonnet',
import 'Allowed_methods/OPTIONS.jsonnet',
import 'Allowed_methods/PUT.jsonnet',
import 'Allowed_methods/DELETE.jsonnet',
import 'Allowed_methods/PATCH.jsonnet',
],
}
