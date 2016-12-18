variable "AWS_REGION" {
  default = "us-east-1"
}

variable "PATH_TO_PUBLIC_KEY" {
}

variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-c481fad3"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-c02b04a8"
  }
}

variable "AWS_AZ" {
  default = "us-east-1b"
  B = "us-east-1b"
  C = "us-east-1c"
  D = "us-east-1d"
}
