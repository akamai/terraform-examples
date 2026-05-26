# PM Includes — Property Manager multi-team workflow

This example demonstrates how multiple teams can collaborate on a single Akamai delivery property using **Property Manager Includes (PM Includes)**. Includes allow the main property configuration to be broken down into smaller, independently managed sub-configurations. Each team owns their own include and their own Terraform state, keeping them fully decoupled from each other and from the central property.

## How it works

```
pm-includes/
├── central/    # Central/platform team — owns the main property and wires in all includes
├── team1/      # Microservices team — owns and manages their own PM Include
└── modules/    # Reusable modules consumed by team1/ and central/
    ├── includes/
    └── property/
```

- Each team folder is a **separate Terraform execution** with its own state file.
- `team1/` (and any future `teamN/`) creates a PM Include and outputs its include ID.
- `central/` reads each team's include ID from their remote state and attaches them to the main property rule tree.
- Adding a new team means creating a new folder alongside `team1/`, running it independently, then referencing its output in `central/`.

## Step 1 — Team applies their include (`team1/`)

Each microservices team manages their own Property Manager rules (via `akamai_property_rules_builder` or raw JSON) and deploys them as a PM Include independently.

```bash
cd team1/
terraform init
terraform apply
```

The include ID is written to the team's state file as an output named `id`. The central team reads this via `terraform_remote_state`.

## Step 2 — Central team applies the main property (`central/`)

The central/platform team manages the delivery property. It pulls each team's include ID from their state and attaches it to the property rule tree under the appropriate path match.

```bash
cd central/
terraform init
terraform apply
```

The `central/main.tf` maps each include ID to one or more path prefixes:

```hcl
locals {
  includes = {
    "${data.terraform_remote_state.team1.outputs.id}" = ["/products"]
    # Add more teams here as needed:
    # "${data.terraform_remote_state.team2.outputs.id}" = ["/checkout"]
  }
}
```

## Adding a new team

1. Copy `team1/` to a new folder (e.g. `team2/`).
2. Update the rules and variables for that team.
3. Run `terraform apply` inside `team2/`.
4. In `central/main.tf`, add a new `terraform_remote_state` datasource pointing to `../team2/terraform.tfstate` and add the new include ID to the `locals.includes` map.
5. Run `terraform apply` inside `central/`.

## Modules

| Module | Path | Description |
|--------|------|-------------|
| `includes` | `modules/includes/` | Creates and activates a PM Include |
| `property` | `modules/property/` | Creates the main delivery property and attaches includes |

## Resources
- [Akamai API Credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials)
- [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs)
- [Akamai CLI for Terraform](https://github.com/akamai/cli-terraform)
- [Akamai Developer YouTube Channel](https://www.youtube.com/c/AkamaiDeveloper)
- [Akamai GitHub](https://github.com/akamai)
