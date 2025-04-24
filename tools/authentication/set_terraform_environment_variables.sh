#!/bin/bash

# Default values
EDGERC="$HOME/.edgerc"
SECTION="default"
ACCOUNT_SWITCH_KEY=""

# Parse command line arguments
while [[ "$#" -gt 0 ]]; do
  case "$1" in
    -e|--edgerc)
      EDGERC="$2"
      shift 2
      ;;
    -s|--section)
      SECTION="$2"
      shift 2
      ;;
    -a|--accountSwitchKey)
      ACCOUNT_SWITCH_KEY="$2"
      shift 2
      ;;
    *)
      echo "Usage: $0 [--edgerc ~/.edgerc] [--section default] [--accountSwitchKey <ask>]"
      exit 1
      ;;
  esac
done

# Check if EdgeRC file exists
if [[ ! -f "$EDGERC" ]]; then
  echo "EdgeRC file '$EDGERC' not found"
  exit 1
fi

CREDENTIALS=$(grep -e "\[$SECTION\]" -A 5 "$EDGERC")

# Extract required values
AKAMAI_HOST=$(echo "$CREDENTIALS" | grep -e "host[ ]*=[ ]*" | awk '{split($0, elements, "="); print elements[2]}' | xargs)
AKAMAI_ACCESS_TOKEN=$(echo "$CREDENTIALS" | grep -e "access_token[ ]*=[ ]*" | awk '{split($0, elements, "="); print elements[2]}' | xargs)
AKAMAI_CLIENT_TOKEN=$(echo "$CREDENTIALS" | grep -e "client_token[ ]*=[ ]*" | awk '{split($0, elements, "="); print elements[2]}' | xargs)
AKAMAI_CLIENT_SECRET=$(echo "$CREDENTIALS" | grep -e "client_secret[ ]*=[ ]*" | awk '{split($0, elements, "="); print elements[2]}' | xargs)
AKAMAI_ACCOUNT_KEY=$(echo "$CREDENTIALS" | grep -e "account_key[ ]*=[ ]*" | awk '{split($0, elements, "="); print elements[2]}' | xargs)


# Validate required values
if [[ -z "$AKAMAI_HOST" || -z "$AKAMAI_ACCESS_TOKEN" || -z "$AKAMAI_CLIENT_TOKEN" || -z "$AKAMAI_CLIENT_SECRET" ]]; then
  echo "Missing required values in section '$SECTION' of EdgeRC file '$EDGERC'"
  exit 1
fi

# Export Terraform environment variables
export TF_VAR_akamai_host="$AKAMAI_HOST"
export TF_VAR_akamai_access_token="$AKAMAI_ACCESS_TOKEN"
export TF_VAR_akamai_client_token="$AKAMAI_CLIENT_TOKEN"
export TF_VAR_akamai_client_secret="$AKAMAI_CLIENT_SECRET"
export TF_VAR_akamai_account_key="$AKAMAI_ACCOUNT_KEY"

echo "Terraform environment variables set"
