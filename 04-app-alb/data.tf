<<<<<<< HEAD
data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.env}/vpc_id"
}
data "aws_ssm_parameter" "app_alb_sg_id" {
  name = "/${var.project_name}/${var.env}/app_alb_sg_id"
}

data "aws_ssm_parameter" "private_subnet_ids" {
  name = "/${var.project_name}/${var.env}/private_subnet_ids"
}
=======
data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.env}/vpc_id"
}
data "aws_ssm_parameter" "app_alb_sg_id" {
  name = "/${var.project_name}/${var.env}/app_alb_sg_id"
}

data "aws_ssm_parameter" "private_subnet_ids" {
  name = "/${var.project_name}/${var.env}/private_subnet_ids"
}
>>>>>>> 98c8a0ec3b321c5063076b9a24dab275f339acd6
