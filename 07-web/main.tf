<<<<<<< HEAD
module "web" {
  source            = "../../terraform-roboshop-app"
  project_name      = var.project_name
  env               = var.env
  common_tags       = var.common_tags
  health_check      = var.health_check
  target_group_port = var.target_group_port
  vpc_id            = data.aws_ssm_parameter.vpc_id.value


}
=======
module "web" {
  source            = "../../terraform-roboshop-app"
  project_name      = var.project_name
  env               = var.env
  common_tags       = var.common_tags
  health_check      = var.health_check
  target_group_port = var.target_group_port
  vpc_id            = data.aws_ssm_parameter.vpc_id.value


}
>>>>>>> 98c8a0ec3b321c5063076b9a24dab275f339acd6
