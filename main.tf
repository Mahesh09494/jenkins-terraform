provider "aws" { 
  region     = "ap-south-1"
}


variable "env" {
  description = "for flag status"
}


resource "aws_s3_bucket" "Maheshs3-123" {
    count = "${var.env == "true"? 1: 0}"
    bucket = "Maheshs3-demo"
}

resource "aws_instance" "Maheshaws-poc"{
    count = "${var.env == "false" ? 1: 0}"
    ami = "ami-0b9064170e32bde34"
    instance_type = "t2.micro" 
}
