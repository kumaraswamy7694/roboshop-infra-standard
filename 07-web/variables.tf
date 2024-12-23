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
    component   = "web"
    Environment = "DEV"
    Terraform   = "true"

  }
}

variable "health_check" {
  default = {
    enabled             = true
    healthy_threshold   = 2 #consier are healthy
    interval            = 15
    matcher             = "200-299"
    path                = "/"
    port                = 80
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 3
  }

}

variable "target_group_port" {
  default = 80

}
variable "target_group_protocol" {
  default = "HTTP"

}
# variable "vpc_id" {


# }
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
    component   = "web"
    Environment = "DEV"
    Terraform   = "true"

  }
}

variable "health_check" {
  default = {
    enabled             = true
    healthy_threshold   = 2 #consier are healthy
    interval            = 15
    matcher             = "200-299"
    path                = "/"
    port                = 80
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 3
  }

}

variable "target_group_port" {
  default = 80

}
variable "target_group_protocol" {
  default = "HTTP"

}
# variable "vpc_id" {


# }
>>>>>>> 98c8a0ec3b321c5063076b9a24dab275f339acd6
