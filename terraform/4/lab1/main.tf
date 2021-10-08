provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "vm" {
  ami           = "ami-087c17d1fe0178315"
  subnet_id     = "subnet-0c1a84742ce464129"
  instance_type = "t3.micro"
  tags = {
    Name = "my-first-tf-node"
  }
}