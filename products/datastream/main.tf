/**
* # DataStream
*
* ## Create a New Data Stream
* Creates a new data stream with all available data sets enabled. 
*
*/

data "akamai_contract" "contract" {
  group_name = var.group_name
}

# Get all fields available
data "akamai_datastream_dataset_fields" "all_fields" {
}

# Get the property IDs
data "akamai_property" "properties" {
  count = length(var.properties)
  name  = var.properties[count.index]
}

locals {
  # Remove the grp_ prefix from the group id
  group_id = parseint(replace(data.akamai_contract.contract.group_id, "grp_", ""), 10)
  # Remove the prp_ prefix from all properties
  property_ids = [for item in data.akamai_property.properties[*].id : replace(item, "prp_", "")]
}

resource "akamai_datastream" "my_datastream" {
  active = true
  delivery_configuration {
    format = "JSON"
    frequency {
      interval_in_secs = 30
    }
  }
  contract_id = data.akamai_contract.contract.id
  dataset_fields = [
    999,  #Stream ID
    1000, #CP code
    1002, #Request ID
    1100, #Request time
    2024, #Edge attempts
    1005, #Bytes
    1006, #Client IP
    1008, #HTTP status code
    1009, #Protocol type
    1011, #Request host
    1012, #Request method
    1013, #Request path
    1014, #Request port
    1015, #Response Content-Length
    1016, #Response Content-Type
    1017, #User-Agent
    2001, #SSL overhead time
    2002, #SSL version
    2003, #Object size
    2004, #Uncompressed size
    2006, #Overhead bytes
    2008, #Total bytes
    2009, #Query string
    2023, #File size bucket
    1019, #Accept-Language
    1023, #Cookie
    1031, #Range
    1032, #Referer
    1037, #X-Forwarded-For
    2005, #Max age
    1033, #Request end time
    1068, #Error code
    1102, #Turn around time
    1103, #Transfer time
    2007, #DNS lookup time
    2021, #Last byte
    2022, #Asnum
    2025, #Time to first byte
    2026, #Startup errors
    2027, #Download time
    2028, #Throughput
    2084, #Prefetch midgress hits
    1082, #Custom field
    2010, #Cache status
    2019, #Cacheable
    1066, #Edge IP
    2012, #Country/Region
    2013, #State
    2014, #City
    2052, #Server country/region
    2053, #Billing region
    2050, #Security rules
    3000, #EdgeWorkers usage
    3001, #EdgeWorkers execution
    2051, #Midgress status
  ]
  group_id    = local.group_id
  properties  = local.property_ids
  stream_name = var.stream_name
  sumologic_connector {
    collector_code = var.sumologic_connector_code
    content_type   = "application/json"
    display_name   = "tf-demo-logs"
    endpoint       = "https://endpoint2.collection.us2.sumologic.com/receiver/v1/http"
    compress_logs  = true
  }
  notification_emails = var.notification_emails
  collect_midgress    = true
}

data "akamai_datastreams" "my_datastreams" {
  group_id   = local.group_id
  depends_on = [akamai_datastream.my_datastream]
}

# Look for the DataStream ID
locals {
  datastream_id = compact([for datastream in data.akamai_datastreams.my_datastreams.streams_details : datastream.stream_name == var.stream_name ? datastream.stream_id : ""])[0]
}
