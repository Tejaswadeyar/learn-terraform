#if ami_id changes then the code will noot run , therfore we declare the ami as below after declaring, even if thr ami changes u will get the ami according to the ami = owner and ami = name

data "aws_ami" "example" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}


  output "ami_id" {
    value = data.aws_ami.example.image_id
  }