local papi = import 'papi/Fresca/v2025-01-13.libsonnet';
papi.rule {
name: "Strengthen security",
comments: |||
    Control the settings that minimize the information your website shares with
    clients and malicious entities to reduce your exposure to threats.
|||,
children: [
import 'Strengthen_security/Allowed_methods.jsonnet',
import 'Strengthen_security/Obfuscate_debug_info.jsonnet',
import 'Strengthen_security/Obfuscate_backend_info.jsonnet',
import 'Strengthen_security/HSTS.jsonnet',
],
}
