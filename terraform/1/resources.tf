provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "ec2-instance-1" {
  ami           = "ami-43242fsd"
  instance_type = "t2.micro"
  key_name = data.aws_instance.ec2_data.key_name
  tags = {
    Name = "tan-ec2-instance-1"
  }
}

data "aws_instance" "ec2_data" {
  instance_id = "43434343"
}

// defining data as config to be used while creating resources
data "aws_vpc" "default_vpc" {
  cidr_block = "10.0.0.0/16"
}