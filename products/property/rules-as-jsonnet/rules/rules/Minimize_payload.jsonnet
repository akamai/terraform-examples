local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "Minimize payload",
comments: |||
    Control the settings that reduce the size of the delivered content and
    decrease the number of bytes sent by your properties. This allows you to cut
    down the network overhead of your website or API.
|||,
children: [
import 'Minimize_payload/Compressible_objects.jsonnet',
],
}
