local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "Accelerate delivery",
comments: |||
    Control the settings related to improving the performance of delivering
    objects to your users.
|||,
children: [
import 'Accelerate_delivery/Origin_connectivity.jsonnet',
import 'Accelerate_delivery/Protocol_optimizations.jsonnet',
import 'Accelerate_delivery/Prefetching.jsonnet',
import 'Accelerate_delivery/Adaptive_acceleration.jsonnet',
],
}
