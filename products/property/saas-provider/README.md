# SaaS Provider

This example shows a use-case where a SaaS provider runs a single Akamai delivery property and adds customer hostnames to it on an ad-hoc basis. Each time new hostnames are onboarded, the configuration provisions SBD (Secure by Default) certificates and creates the ACME DNS challenge records. The property is deliberately **not** activated to production at this stage — production activation is deferred to the go-live step once the certificates have deployed.

## Repository structure

```
saas-provider/
├── example/    # Step 1 — creates the property, SBD certificate challenges, and DNS ACME records
├── golive/     # Step 2 — updates DNS to CNAME hostnames to the Akamai edge hostname (run once certs are ready)
└── modules/    # Reusable modules consumed by example/ and golive/
    ├── property/
    ├── dns/
    └── golive/
```

## Workflow

### Step 1 — Deploy the property (`example/`)

This Terraform configuration creates:
- The Akamai delivery property with the list of customer hostnames
- SBD certificate challenges for each hostname
- DNS ACME validation records

```bash
cd example/
terraform init
terraform apply
```

After `apply` completes, the SBD certificates will begin provisioning. Wait approximately **8 minutes** before proceeding to Step 2.

### Step 2 — Go live (`golive/`)

This is a **separate Terraform execution**. It updates DNS to CNAME each hostname to the Akamai edge hostname and activates the property to production. A precondition verifies that the SBD certificates are fully deployed before allowing the DNS change to proceed.

> If the precondition fails, the certificates are still provisioning — wait a short while and re-run.

```bash
cd golive/
terraform init
terraform apply
```

#### Required variables

| Name | Description |
|------|-------------|
| `property_name` | Name of the property (must match Step 1) |
| `edge_hostname` | The Akamai edge hostname (e.g. `example.org.edgesuite.net`) |
| `hostnames` | List of customer hostnames to CNAME to the edge hostname |
| `zone` | The DNS zone being updated |

## Modules

| Module | Path | Description |
|--------|------|-------------|
| `property` | `modules/property/` | Creates the Akamai delivery property and stages it (no production activation) |
| `dns` | `modules/dns/` | Creates DNS ACME challenge records for SBD certificate validation |
| `golive` | `modules/golive/` | CNAMEs hostnames to the edge hostname and activates to production once certs are ready |

## Resources
- [Akamai API Credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials)
- [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs)
- [Akamai CLI for Terraform](https://github.com/akamai/cli-terraform)
- [Akamai Developer YouTube Channel](https://www.youtube.com/c/AkamaiDeveloper)
- [Akamai GitHub](https://github.com/akamai)