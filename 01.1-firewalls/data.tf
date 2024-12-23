<<<<<<< HEAD
data "aws_vpc" "default" {
  default = true
}


data "http" "myip" {
  url = "https://ipv4.icanhazip.com"
}

data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.env}/vpc_id"
}
=======
data "aws_vpc" "default" {
  default = true
}


data "http" "myip" {
  url = "https://ipv4.icanhazip.com"
}

data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.env}/vpc_id"
}
>>>>>>> 98c8a0ec3b321c5063076b9a24dab275f339acd6
