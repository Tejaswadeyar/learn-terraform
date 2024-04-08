output "v1" {
  value = var.v1
}

output "First_Value_in_list" {
  value = var.v2[0]
}

output "Second_value_in_list" {
  value = var.v2[1]
}

output "value_in_map" {
  value = var.v3["abc"]
}


#output "value_in_map" {
#  value = var.v3["abc"]
#}


output "value_in_map1" {
  value = lookup(var.v3,"abc1", null]
}