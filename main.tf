terraform {
  backend "s3" {
    bucket = "nanuka-aws-bucket-7878"    
    key    = "terraform/state"           
    region = "us-west-2"                 
    dynamodb_table = "terraform-locks"   
    encrypt = true                       
  }
}

provider "aws" {
  region = "us-west-2"  
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "nanuka-aws-bucket-7878"  
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "MyTerraformS3Bucket"
    Environment = "Dev"
  }
}

resource "aws_instance" "example_instance" {
  ami           = "ami-08e2d37b6a0129927"  # ubuntu ami 
  instance_type = "t2.micro"

  tags = {
    Name = "MyTerraformEC2"
  }
}

