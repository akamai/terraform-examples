local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "Traffic reporting",
comments: |||
    Identify your main traffic segments so you can granularly zoom in your
    traffic statistics like hits, bandwidth, offload, response codes, and
    errors.
|||,
behaviors: [
papi.behaviors.cpCode {
  "value": {
    "id": std.extVar('default_cpcode')
  }
},
],
}
