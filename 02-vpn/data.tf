<<<<<<< HEAD
data "aws_vpc" "default" {
  default = true
}


data "http" "myip" {
  url = "https://ipv4.icanhazip.com"
}

data "aws_ssm_parameter" "vpn_sg_id" {
  name = "/${var.project_name}/${var.env}/vpn_sg_id"
}

data "aws_ami" "devops_ami" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]

  filter {
    name   = "name"
    values = ["Centos-8-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
=======
data "aws_vpc" "default" {
  default = true
}


data "http" "myip" {
  url = "https://ipv4.icanhazip.com"
}

data "aws_ssm_parameter" "vpn_sg_id" {
  name = "/${var.project_name}/${var.env}/vpn_sg_id"
}

data "aws_ami" "devops_ami" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]

  filter {
    name   = "name"
    values = ["Centos-8-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
>>>>>>> 98c8a0ec3b321c5063076b9a24dab275f339acd6
