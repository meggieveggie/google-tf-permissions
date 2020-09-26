locals {
  /*
    creates a structure of
    [
        {
          project    = {PROJECT_NAME}
          permission = {ROLE} 
        }
    ]
  */

  permissions = flatten([
    for project in var.projects : [
      for permission in project.permissions :
      {
        project = project.name,
        role    = permission
      }
    ]
  ])
}

resource "google_project_iam_member" "project" {

  /*
      creates a structure as below so we can use terraform for each
      where order does not matter
      {
        "${var.user}:${permission.project}:${permission.role}" = {
          project    = {PROJECT_NAME}
          permission = {ROLE}
        },
      }
    */

  for_each = {
    for permission in local.permissions :
    "${var.user}:${permission.project}:${permission.role}" => permission
  }

  project = each.value.project
  role    = each.value.role
  member  = var.user

}

