local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "Prefetching",
comments: |||
    Instruct edge servers to retrieve embedded resources before the browser
    requests them.
|||,
children: [
import 'Prefetching/Prefetching_objects.jsonnet',
import 'Prefetching/Prefetchable_objects.jsonnet',
],
}
