terraform import -var-file=./environments/$1.tfvars akamai_edge_hostname.edge-hostname-edgekey-net ehn_4874468,ctr_1-1NC95D,grp_257477
terraform import -var-file=./environments/$1.tfvars akamai_cp_code.cp-code cpc_1642452,ctr_1-1NC95D,grp_257477
terraform import -var-file=./environments/$1.tfvars akamai_property.github-workflow-tf-demo prp_1058679,ctr_1-1NC95D,grp_257477

