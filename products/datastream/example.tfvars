group_name  = "Example Testing"
stream_name = "tf-example-stream"
datadog_connector = {
  auth_token   = "your-auth-token"
  display_name = "example-datadog"
  endpoint     = "https://example.datadog.com/v1/input"
}
properties = [
  "example-testing"
]
notification_emails = [
  "user@example.com"
]
