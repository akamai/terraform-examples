# Hostname Buckets

This example shows a use-case where hostname buckets and default certificates are used to manage thousands of hostnames on a single delivery property. It returns a map of ACME challenges for validating the certificate for each hostname — the map key is the challenge hostname and the value is the CNAME target.

## Repository structure

```
hostname-buckets/
├── example/    # Step 1 — creates the property, SBD certificate challenges, and DNS ACME records
├── golive/     # Step 2 — updates DNS to CNAME hostnames to the Akamai edge hostname (run once the domain is ready)
└── modules/    # Reusable modules consumed by example/ and golive/
    ├── property/
    ├── dns/
    └── golive/
```

## Workflow

### Step 1 — Deploy the property (`example/`)

This Terraform configuration creates:
- The Akamai delivery property with the list of hostnames
- SBD (Secure by Default) certificate challenges for each hostname
- DNS ACME validation records

After `apply` completes, the SBD certificates will begin provisioning. Wait approximately **8 minutes** before proceeding to Step 2.

### Step 2 — Go live (`golive/`)

This is a **separate Terraform execution**. It updates DNS to CNAME each hostname to the Akamai edge hostname. A precondition verifies that the SBD certificates are fully deployed before allowing the DNS change to proceed.

> If the precondition fails, the certificates are still provisioning — wait a short while and re-run.

#### Required variables

| Name | Description |
|------|-------------|
| `property_name` | Name of the property (must match Step 1) |
| `edge_hostname` | The Akamai edge hostname (e.g. `example.org.edgesuite.net`) |
| `hostnames` | List of hostnames to CNAME to the edge hostname |
| `zone` | The DNS zone being updated |

## Modules

| Module | Path | Description |
|--------|------|-------------|
| `property` | `modules/property/` | Creates the Akamai delivery property and activates it |
| `dns` | `modules/dns/` | Creates DNS ACME challenge records |
| `golive` | `modules/golive/` | CNAMEs hostnames to the edge hostname once certs are ready |

## Resources
- [Akamai API Credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials)
- [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs)
- [Akamai CLI for Terraform](https://github.com/akamai/cli-terraform)
- [Akamai Developer YouTube Channel](https://www.youtube.com/c/AkamaiDeveloper)
- [Akamai GitHub](https://github.com/akamai)