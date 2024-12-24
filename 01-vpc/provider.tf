
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }


  backend "s3" {
    bucket         = "roboshop-remote-state"
    key            = "vpc"
    region         = "us-east-1"
    dynamodb_table = "roboshop-locking"


  }

}





# Configure the AWS Provider
# you can give access and security here but security problem
provider "aws" {
  region = "us-east-1"
}

=======
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }


  backend "s3" {
    bucket         = "roboshop-remote-state"
    key            = "vpc"
    region         = "us-east-1"
    dynamodb_table = "roboshop-locking"


  }

}





# Configure the AWS Provider
# you can give access and security here but security problem
provider "aws" {
  region = "us-east-1"
}


