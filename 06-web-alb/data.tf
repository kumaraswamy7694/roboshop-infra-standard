<<<<<<< HEAD
data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.env}/vpc_id"
}
data "aws_ssm_parameter" "web_alb_sg_id" {
  name = "/${var.project_name}/${var.env}/web_alb_sg_id"
}

data "aws_ssm_parameter" "public_subnet_ids" {
  name = "/${var.project_name}/${var.env}/public_subnet_ids"
}
=======
data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.env}/vpc_id"
}
data "aws_ssm_parameter" "web_alb_sg_id" {
  name = "/${var.project_name}/${var.env}/web_alb_sg_id"
}

data "aws_ssm_parameter" "public_subnet_ids" {
  name = "/${var.project_name}/${var.env}/public_subnet_ids"
}
>>>>>>> 98c8a0ec3b321c5063076b9a24dab275f339acd6
