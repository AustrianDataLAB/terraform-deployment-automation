# Configure the provider
provider "null" {}

# Define a mock resource
resource "null_resource" "mock_example" {
  # Use count to create multiple instances
  count = 3

  # Triggers to re-create the resource when changed
  triggers = {
    timestamp = timestamp()
  }

  # Simulate some provisioner actions
  provisioner "local-exec" {
    command = "echo Created mock resource at ${timestamp()}"
  }
}
