include "env" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/app"
}

inputs = {
  instance_count = 3
}
