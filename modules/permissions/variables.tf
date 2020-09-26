variable "projects" {
  description = "permission object"
  type = list(object({
    name        = string,
    permissions = list(string),
  }))
}

variable "user" {
  type        = string
  description = "The user to apply the permissions to"
}