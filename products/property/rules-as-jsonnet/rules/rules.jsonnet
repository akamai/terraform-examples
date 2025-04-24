local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
{
productId: "Fresca",
ruleFormat: "v2025-01-13",
contractId: "1-1NC95D",
groupId: "161347",
rules: papi.root {
name: "default",
comments: |||
    The Default Rule template contains all the necessary and recommended
    behaviors. Rules are evaluated from top to bottom and the last matching rule
    wins.
|||,
options: {
is_secure: false,
},
variables: import 'pmvariables.jsonnet',
behaviors: [
papi.behaviors.origin {
  "cacheKeyHostname": "REQUEST_HOST_HEADER",
  "compress": true,
  "enableTrueClientIp": true,
  "forwardHostHeader": "ORIGIN_HOSTNAME",
  "hostname": std.extVar('default_origin'),
  "httpPort": 80,
  "httpsPort": 443,
  "ipVersion": "IPV4",
  "originSni": true,
  "originType": "CUSTOMER",
  "trueClientIpClientSetting": false,
  "trueClientIpHeader": "True-Client-IP",
  "verificationMode": "PLATFORM_SETTINGS",
  "minTlsVersion": "DYNAMIC"
},
papi.behaviors.http3 {
  "enable": true
},
papi.behaviors.autoDomainValidation,
],
children: [
import 'rules/Augment_insights.jsonnet',
import 'rules/Accelerate_delivery.jsonnet',
import 'rules/Offload_origin.jsonnet',
import 'rules/Strengthen_security.jsonnet',
import 'rules/Increase_availability.jsonnet',
import 'rules/Minimize_payload.jsonnet',
],
}
}
