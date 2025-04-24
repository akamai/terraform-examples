local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "Log delivery",
comments: |||
    Specify the level of detail you want to be logged in your Log Delivery
    Service reports. Log User-Agent Header to obtain detailed information in the
    Traffic by Browser and OS report.
|||,
behaviors: [
papi.behaviors.report {
  "logHost": true,
  "logReferer": false,
  "logUserAgent": false,
  "logAcceptLanguage": false,
  "logCookies": "OFF",
  "logCustomLogField": false,
  "logEdgeIP": false,
  "logXForwardedFor": false
},
],
}
