/**
* # EdgeKV
*
* ## Create a New EdgeKV Namespace, Groups and Items
* Creates a new EdgeKV namespace and 2 new groups within the namespaces. It also creates items inside both groups.
*/

data "akamai_contract" "contract" {
  group_name = var.group_name
}

# Create new namespace
resource "akamai_edgekv" "edgekv" {
  namespace_name       = var.namespace_name
  network              = var.network
  group_id             = parseint(replace(data.akamai_contract.contract.group_id, "grp_", ""), 10) # Akamai Access Group ID
  retention_in_seconds = 0
  geo_location         = var.geo_location
}

# Create a new group within the namespace and add items
resource "akamai_edgekv_group_items" "countries_group" {
  namespace_name = var.namespace_name
  network        = var.network
  group_name     = var.ekv_group_name_1 # Group name within the namespace. Not to be confused with the Akamai Access Group
  items          = local.items_countries

  depends_on = [akamai_edgekv.edgekv]
}

data "akamai_edgekv_group_items" "countries_group" {
  namespace_name = var.namespace_name
  network        = var.network
  group_name     = var.ekv_group_name_1
}

# Create a new group within the namespace and add items
resource "akamai_edgekv_group_items" "translations_group" {
  namespace_name = var.namespace_name
  network        = var.network
  group_name     = var.ekv_group_name_2 # Group name within the namespace. Not to be confused with the Akamai Access Group
  items          = local.items_translations

  depends_on = [akamai_edgekv.edgekv]
}

data "akamai_edgekv_group_items" "translations_group" {
  namespace_name = var.namespace_name
  network        = var.network
  group_name     = var.ekv_group_name_2
}
