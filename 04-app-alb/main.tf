<<<<<<< HEAD
resource "aws_lb" "app_alb" {
  name               = "${var.project_name}-${var.common_tags.component}"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [data.aws_ssm_parameter.app_alb_sg_id.value]
  subnets            = split(",", data.aws_ssm_parameter.private_subnet_ids.value)

  #enable_deletion_protection = true



  tags = var.common_tags
}


# resource "aws_lb" "front_end" {
#   # ...
# }

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response from App alb"
      status_code  = "200"
    }
  }
}


module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 3.0"

  zone_name = "kumaraswamy.xyz"

  records = [
    {
      name = "*.app"
      type = "A"
      alias = {
        name    = aws_lb.app_alb.dns_name
        zone_id = aws_lb.app_alb.zone_id
      }
    }
  ]
}
=======
resource "aws_lb" "app_alb" {
  name               = "${var.project_name}-${var.common_tags.component}"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [data.aws_ssm_parameter.app_alb_sg_id.value]
  subnets            = split(",", data.aws_ssm_parameter.private_subnet_ids.value)

  #enable_deletion_protection = true



  tags = var.common_tags
}


# resource "aws_lb" "front_end" {
#   # ...
# }

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response from App alb"
      status_code  = "200"
    }
  }
}


module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 3.0"

  zone_name = "kumaraswamy.xyz"

  records = [
    {
      name = "*.app"
      type = "A"
      alias = {
        name    = aws_lb.app_alb.dns_name
        zone_id = aws_lb.app_alb.zone_id
      }
    }
  ]
}
>>>>>>> 98c8a0ec3b321c5063076b9a24dab275f339acd6
