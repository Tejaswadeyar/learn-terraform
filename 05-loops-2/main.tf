variable "fruits1" {
  default     = {
    apple     = 10
    banana    = 100
  }
}


variable "fruits2" {
  default   = {
    apple   = {
      name  = "apple"
      quantity = 10
    }
    banana = {
      name = "banana"
      quantity = 100
    }
  }
}


resource "dummy_thin" "this1"{
  for_each = var.fruits1
  name = "$(each.key} = ${each.value}"
}