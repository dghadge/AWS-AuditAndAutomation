data "aws_availability_zones" "available" {}

variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-c481fad3"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-c02b04a8"
  }
}

variable "AWS_AZ_1B" {
    default = "us-east-1b"
}
variable "AWS_AZ_1C" {
    default = "us-east-1c"
}
variable "AWS_AZ_1D" {
    default = "us-east-1d"
}
