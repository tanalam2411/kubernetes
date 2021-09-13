variable "s3_bucket_name" {
  //  default = "default-bucket"
  description = "default bucket to use"
  //  type = string
  //  validation {
  //  }
}


resource "aws_s3_bucket" "variable_s3_bucket" {
  // ternary operation, if s3_bucket_name is "" set bucket as $s3_bucket_name-dev else $s3_bucket_name
  bucket = var.s3_bucket_name == "" ? "${var.s3_bucket_name}-dev" : var.s3_bucket_name
}

// customized datatype
locals {
  instance_name = "dev-instance"
  instance_type = "t2.micro"
}


resource "aws_instance" "my-instance-1" {
  ami           = "ami-43223233dsf"
  instance_type = local.instance_type
  tags = {
    Name = local.instance_name
  }
}