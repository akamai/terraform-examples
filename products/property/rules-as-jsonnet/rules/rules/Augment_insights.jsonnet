local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "Augment insights",
comments: |||
    Control the settings related to monitoring and reporting. This gives you
    additional visibility into your traffic and audiences.
|||,
children: [
import 'Augment_insights/Traffic_reporting.jsonnet',
import 'Augment_insights/mPulse_RUM.jsonnet',
import 'Augment_insights/Geolocation.jsonnet',
import 'Augment_insights/Log_delivery.jsonnet',
],
}
