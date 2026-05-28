# Terraform Examples

A collection of ready-to-use [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs/) examples covering a wide range of products and use-cases. Each example can be run independently and is intended to help you get started quickly.

> **Looking for production-ready templates?** Visit [terraform-templates](https://github.com/akamai/terraform-templates) for fully automated, multi-environment templates with deployment pipelines.

> **Want to export existing config?** Use the [Akamai CLI for Terraform](https://github.com/akamai/cli-terraform) to export your Akamai Control Center configuration to HCL.

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.9.0
- [Akamai Terraform Provider](https://registry.terraform.io/providers/akamai/akamai/latest)
- [Akamai API credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials) configured in `~/.edgerc`

## Repository Structure

```
products/    # Standalone examples, one per Akamai product
snippets/    # Reusable HCL code fragments
tools/       # Helper scripts (authentication, import conversion)
workflows/   # CI/CD workflow examples (GitHub Actions, multi-pipeline, PowerShell)
```

## Products

| Directory | Description |
|-----------|-------------|
| [`products/aap/`](products/aap/) | App & API Protector (AAP) — creates a security config with SIEM, Client Reputation and Slow Post |
| [`products/aapasm/`](products/aapasm/) | App & API Protector with Advanced Security Module (AAPASM) |
| [`products/api-definitions/api/`](products/api-definitions/api/) | API Definitions lifecycle using a raw JSON descriptor |
| [`products/api-definitions/openapi/`](products/api-definitions/openapi/) | API Definitions lifecycle from an OpenAPI 3.0 spec |
| [`products/certificates/cloud-certificates/`](products/certificates/cloud-certificates/) | Cloud Certificate Manager (CCM) workflow |
| [`products/certificates/cps-domain-validation/`](products/certificates/cps-domain-validation/) | CPS DV certificate provisioning |
| [`products/certificates/cps-domain-validation-simple/`](products/certificates/cps-domain-validation-simple/) | Simplified CPS DV certificate provisioning |
| [`products/certificates/cps-third-party/`](products/certificates/cps-third-party/) | CPS third-party certificate provisioning |
| [`products/certificates/default-dv/`](products/certificates/default-dv/) | Default DV certificate |
| [`products/client-lists/`](products/client-lists/) | Best-practice Client Lists for Application Security (IP/Geo block, bypass lists, etc.) |
| [`products/cloudlets/edge-redirector-non-shared-csv/`](products/cloudlets/edge-redirector-non-shared-csv/) | Edge Redirector Cloudlet (non-shared, CSV rules) |
| [`products/cloudlets/edge-redirector-shared-mult-envs/`](products/cloudlets/edge-redirector-shared-mult-envs/) | Edge Redirector Cloudlet (shared policy, multiple environments) |
| [`products/cloudlets/phased-release-shared/`](products/cloudlets/phased-release-shared/) | Phased Release Cloudlet with a shared policy |
| [`products/datastream/`](products/datastream/) | DataStream 2 — creates a stream with all available datasets |
| [`products/domain-ownership/late-validation/`](products/domain-ownership/late-validation/) | Domain ownership validation (late) |
| [`products/domain-ownership/pre-validation/`](products/domain-ownership/pre-validation/) | Domain ownership validation (pre) |
| [`products/edgedns/`](products/edgedns/) | EdgeDNS zone and record management |
| [`products/edgekv/`](products/edgekv/) | EdgeKV namespace, groups and items |
| [`products/edgeworker/`](products/edgeworker/) | EdgeWorkers — bundle creation, deployment and activation |
| [`products/gtm/`](products/gtm/) | Global Traffic Management domain with datacenters and load-balanced properties |
| [`products/ivm/ivm-images/`](products/ivm/ivm-images/) | Image & Video Manager — image policies |
| [`products/ivm/ivm-videos/`](products/ivm/ivm-videos/) | Image & Video Manager — video policies |
| [`products/mtls/edge-truststore/`](products/mtls/edge-truststore/) | mTLS edge truststore (CPS + PAPI integration) |
| [`products/mtls/origin-keystore/`](products/mtls/origin-keystore/) | mTLS origin keystore |
| [`products/network-lists/`](products/network-lists/) | Network Lists module |
| [`products/property/bulk-creation/`](products/property/bulk-creation/) | Property Manager bulk property creation |
| [`products/property/hostname-buckets/`](products/property/hostname-buckets/) | Property Manager hostname buckets |
| [`products/property/pm-includes/`](products/property/pm-includes/) | Property Manager includes |
| [`products/property/rules-as-hcl/`](products/property/rules-as-hcl/) | Property Manager rules written directly in HCL |
| [`products/property/rules-as-jsonnet/`](products/property/rules-as-jsonnet/) | Property Manager rules written in Jsonnet |
| [`products/property/rules-as-snippets/`](products/property/rules-as-snippets/) | Property Manager rules split into JSON snippets |
| [`products/property/saas-provider/`](products/property/saas-provider/) | Property Manager SaaS provider pattern |

## Snippets

Reusable, standalone HCL fragments in [`snippets/`](snippets/) that can be dropped into any configuration:

| File | Description |
|------|-------------|
| [`authentication-options.tf`](snippets/authentication-options.tf) | Common Akamai provider authentication patterns |
| [`dynamic-origins-rule.tf`](snippets/dynamic-origins-rule.tf) | Dynamic origins in a Property Manager rule |
| [`dynamic-property-hostnames.tf`](snippets/dynamic-property-hostnames.tf) | Dynamic property hostname generation |
| [`obtain-and-reference-bot-ids.tf`](snippets/obtain-and-reference-bot-ids.tf) | Look up and reference Bot Manager IDs |
| [`obtain-sbd-validations.tf`](snippets/obtain-sbd-validations.tf) | Obtain SBD (Secure By Default) validations |
| [`preconditions-are-useful.tf`](snippets/preconditions-are-useful.tf) | Using Terraform preconditions for input validation |

## Tools

| Directory | Description |
|-----------|-------------|
| [`tools/authentication/`](tools/authentication/) | Bash and PowerShell scripts to load Akamai API credentials from `~/.edgerc` into Terraform environment variables for local testing |
| [`tools/import-converter/`](tools/import-converter/) | Python script to convert the `import.sh` generated by the Akamai Terraform CLI into inline Terraform `import` blocks (compatible with Terraform Cloud and other platforms that lack shell access) |

## Workflows

| Directory | Description |
|-----------|-------------|
| [`workflows/github-workflow/`](workflows/github-workflow/) | GitHub Actions workflow that runs Terraform to manage a Property Manager configuration across multiple environments, with remote state stored in Linode Object Storage |
| [`workflows/multi-pipeline/`](workflows/multi-pipeline/) | Multi-environment pipeline pattern — same module source, environment-specific `.tfvars`, sequentially deployed through dev → qa → stage → prod |
| [`workflows/external_pwsh/`](workflows/external_pwsh/) | Use Akamai PowerShell module as an `external` data source to call any Akamai API not yet covered by the Terraform provider |

## Getting Started

1. **Set up credentials** — configure your `~/.edgerc` file with your [Akamai API credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials), then optionally use the helper scripts in [`tools/authentication/`](tools/authentication/) to export them as environment variables.

2. **Pick an example** — browse the tables above and navigate to the relevant directory.

3. **Initialise and apply**:
   ```shell
   cd products/<example>
   cp example.tfvars terraform.tfvars   # edit values to match your account
   terraform init
   terraform plan
   terraform apply
   ```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on how to contribute, including the pre-commit setup (`terraform-docs` and `terraform fmt`) and the semantic PR conventions used for changelog generation.

## Resources

- [Akamai Terraform Provider documentation](https://techdocs.akamai.com/terraform/docs/)
- [Akamai CLI for Terraform](https://github.com/akamai/cli-terraform)
- [Terraform Best Practices](https://www.terraform-best-practices.com/)
- [Akamai Developer YouTube Channel](https://www.youtube.com/c/AkamaiDeveloper)
- [Akamai on GitHub](https://github.com/akamai)