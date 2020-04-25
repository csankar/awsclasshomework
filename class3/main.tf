provider "aws" {
  region = "eu-west-2"
}

resource "aws_security_group" "class_demo" {
  name        = "class_demo"
  description = "Allowing Port 22 and Port 80 to the outside World."
}