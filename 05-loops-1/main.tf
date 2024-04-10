resource "null_resource" "test" {
  count = 10
}


# By providing count , resource will become list

