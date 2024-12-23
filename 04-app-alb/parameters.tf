<<<<<<< HEAD
resource "aws_ssm_parameter" "app_alb_listener_arn" {
  name  = "/${var.project_name}/${var.env}/app_alb_listener_arn"
  type  = "String"
  value = aws_lb_listener.http.arn
}
=======
resource "aws_ssm_parameter" "app_alb_listener_arn" {
  name  = "/${var.project_name}/${var.env}/app_alb_listener_arn"
  type  = "String"
  value = aws_lb_listener.http.arn
}
>>>>>>> 98c8a0ec3b321c5063076b9a24dab275f339acd6
