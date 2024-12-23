<<<<<<< HEAD
variable "project_name" {
  default = "roboshop"

}

# variable "sg_ingress_rules" {
#   default = []

# }

variable "env" {
  default = "dev"

}
variable "common_tags" {
  default = {
    Project     = "roboshop"
    component   = "MongoDB"
    Environment = "DEV"
    Terraform   = "true"

  }
}

variable "zone_name" {
  default = "kumaraswamy.xyz"

}
=======
variable "project_name" {
  default = "roboshop"

}

# variable "sg_ingress_rules" {
#   default = []

# }

variable "env" {
  default = "dev"

}
variable "common_tags" {
  default = {
    Project     = "roboshop"
    component   = "MongoDB"
    Environment = "DEV"
    Terraform   = "true"

  }
}

variable "zone_name" {
  default = "kumaraswamy.xyz"

}
>>>>>>> 98c8a0ec3b321c5063076b9a24dab275f339acd6
