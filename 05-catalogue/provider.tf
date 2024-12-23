<<<<<<< HEAD
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }


  backend "s3" {
    bucket         = "roboshop-remote-state"
    key            = "catalogue"
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
    key            = "catalogue"
    region         = "us-east-1"
    dynamodb_table = "roboshop-locking"


  }

}





# Configure the AWS Provider
# you can give access and security here but security problem
provider "aws" {
  region = "us-east-1"
}

>>>>>>> 98c8a0ec3b321c5063076b9a24dab275f339acd6
