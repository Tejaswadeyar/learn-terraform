variable "v1"{
  default = "Hello world "
}

variable "v2" {
  default = ["Hello world", 100, true ]
}
## A variable list can have different data types

variable "v3" {
  default = {
    abc = 100
    xyz = "Two Hundred"
  }
}