// default provider
provider "aws" {
  alias  = "aws_test"
  region = "us-east-2"
  //  version = "~> 2.0" // aws cli == terraform version // deprecated
}

// provider "aws.virginia"
provider "aws" {
  alias  = "aws_virginia"
  region = "us-east-1"
}


resource "aws_s3_bucket" "virginia_bucket" {
  provider = aws.virginia
  bucket   = "vir_buc_1"
}

resource "aws_s3_bucket" "default_bucket" {
  bucket = "us_east_buc_2"
}