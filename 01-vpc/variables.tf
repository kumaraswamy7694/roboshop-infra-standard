<<<<<<< HEAD
variable "project_name" {
  default = "roboshop"

}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "env" {
  default = "dev"

}
variable "common_tags" {
  default = {
    Project     = "roboshop"
    Environment = "DEV"
    Terraform   = "true"
  }
}

variable "public_subnet_cidr" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidr" {
  default = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "database_subnet_cidr" {
  default = ["10.0.21.0/24", "10.0.22.0/24"]
}
=======
variable "project_name" {
  default = "roboshop"

}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "env" {
  default = "dev"

}
variable "common_tags" {
  default = {
    Project     = "roboshop"
    Environment = "DEV"
    Terraform   = "true"
  }
}

variable "public_subnet_cidr" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidr" {
  default = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "database_subnet_cidr" {
  default = ["10.0.21.0/24", "10.0.22.0/24"]
}
>>>>>>> 98c8a0ec3b321c5063076b9a24dab275f339acd6