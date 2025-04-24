# Inline Import Converter

This simple script will convert import.sh provided by the Akamai Terraform CLI to use inline Terraform import statements. This prevents users from requiring shell access to manipulate their state (which is unavailable in a number of platforms, e.g. Terraform Cloud), and will also run significantly more quickly.

## Usage

```shell
python convert.py
```