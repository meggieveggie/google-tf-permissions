# Google Terraform Permissions

This is a module to handle google terraform permissions in a GitOps way

## Example Usage

```terraform
module "permissions" {
  source = "github.com/meggieveggie/google-tf-permissions//modules/permissions?ref=master"

  user = "user:example.user@yourcompany.com"
  projects = [
    {
      name = "my-awesome-google-project"
      permissions = [
        "role/container.Admin"
      ]
    }
  ]
}
```
