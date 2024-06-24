resource "random_password" "template" {
  for_each = var.users
    length  = 20
    special = false
}

resource "postgresql_role" "template" {
  for_each = var.users
    name     = each.key
    password = random_password.template[each.key].result
    login    = true
}

locals {
  db_user_pairs = flatten([
    for user, user_data in var.users : [
      for db in user_data.databases : {
        user      = user
        database  = db
        privileges = user_data.privileges
      }
    ]
  ])
}

resource "postgresql_grant" "template" {
  for_each = { for pair in local.db_user_pairs : "${pair.database}:${pair.user}" => pair }
    database    = each.value.database
    role        = each.value.user
    schema      = "public"
    object_type = "table"
    objects     = []
    privileges  = each.value.privileges
  depends_on = [postgresql_role.template]
}
