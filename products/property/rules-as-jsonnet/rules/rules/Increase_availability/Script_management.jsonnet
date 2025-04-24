local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "Script management",
comments: |||
    Enable Script Management to minimize performance and availability impacts
    from third-party JavaScripts.
|||,
behaviors: [
papi.behaviors.scriptManagement {
  "enabled": false
},
],
}
