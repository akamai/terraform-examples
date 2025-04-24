local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "Prefetching objects",
comments: "Define for which HTML pages prefetching should be enabled.",
behaviors: [
papi.behaviors.prefetch {
  "enabled": true
},
],
children: [
import 'Prefetching_objects/Bots.jsonnet',
],
}
