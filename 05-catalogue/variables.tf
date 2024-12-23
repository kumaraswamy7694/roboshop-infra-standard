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
    component   = "catalogue"
    Environment = "DEV"
    Terraform   = "true"

  }
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
    component   = "catalogue"
    Environment = "DEV"
    Terraform   = "true"

  }
}

>>>>>>> 98c8a0ec3b321c5063076b9a24dab275f339acd6
