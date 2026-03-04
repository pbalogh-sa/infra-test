
terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = ">= 3.0.0"
    }
  }
}

resource "null_resource" "example" {
  triggers = {
    # Changes every run to make this resource re-create on each apply.
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = "echo 'null_resource ran at ${self.triggers.always_run}'"
  }
}

output "null_resource_example_id" {
  value = null_resource.example.id
}
