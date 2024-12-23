<<<<<<< HEAD
module "vpn_sg" {
  source         = "../../terraform-aws-securitygroup"
  project_name   = var.project_name
  sg_name        = "roboshop-vpn"
  sg_description = "allowing all ports form my home IP"
  #sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_vpc.default.id
  common_tags = merge(
    var.common_tags,
    {
      component = "VPN"
      Name      = "roboshop-vpn"
    }
  )

}

module "web_sg" {
  source         = "../../terraform-aws-securitygroup"
  project_name   = var.project_name
  sg_name        = "web-sg"
  sg_description = "allowing all traffic form catalogue and user and vpn"
  #sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = merge(
    var.common_tags,
    {
      component = "web"
    }
  )

}

module "app_alb_sg" {
  source         = "../../terraform-aws-securitygroup"
  project_name   = var.project_name
  sg_name        = "App-Alb"
  sg_description = "allowing all traffic form catalogue and user and vpn"
  #sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = merge(
    var.common_tags,
    {
      component = "App",
      Name      = "App-Alb"
    }
  )

}


module "web_alb_sg" {
  source         = "../../terraform-aws-securitygroup"
  project_name   = var.project_name
  sg_name        = "web_alb_sg"
  sg_description = "allowing all traffic form catalogue and user and vpn"
  #sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = merge(
    var.common_tags,
    {
      component = "web",
      Name      = "web_alb_sg"
    }
  )

}




module "mongodb_sg" {
  source         = "../../terraform-aws-securitygroup"
  project_name   = var.project_name
  sg_name        = "mongodb-sg"
  sg_description = "allowing all traffic form catalogue and user and vpn"
  #sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = merge(
    var.common_tags,
    {
      component = "MongoDB"
      Name      = "mongodb"
    }
  )

}


module "catalogue_sg" {
  source         = "../../terraform-aws-securitygroup"
  project_name   = var.project_name
  sg_name        = "catalogue-sg"
  sg_description = "allowing all traffic form catalogue and user and vpn"
  #sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = merge(
    var.common_tags,
    {
      component = "catalogue"
      Name      = "catalogue"
    }
  )

}


#this is allowing all catalogue instances to mongodb
resource "aws_security_group_rule" "mongodb_catalogue" {
  type                     = "ingress"
  description              = "Allowing por number 27017 form catalogue"
  from_port                = 27017
  to_port                  = 27017
  protocol                 = "tcp"
  source_security_group_id = module.catalogue_sg.security_group_id
  #cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  #ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = module.mongodb_sg.security_group_id
}
#this is allowing traffic from port no 22 for trouble shooting purposer
resource "aws_security_group_rule" "mongodb_vpn" {
  type                     = "ingress"
  description              = "Allowing por number 27017 form catalogue"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = module.vpn_sg.security_group_id
  #cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  #ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = module.mongodb_sg.security_group_id
}



resource "aws_security_group_rule" "vpn" {
  type        = "ingress"
  from_port   = 0
  to_port     = 65535
  protocol    = "tcp"
  cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  #ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = module.vpn_sg.security_group_id
}

resource "aws_security_group_rule" "catalogue_vpn" {
  type                     = "ingress"
  description              = "Allowing por number 22 form vpn "
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = module.vpn_sg.security_group_id
  #cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  #ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = module.catalogue_sg.security_group_id
}

resource "aws_security_group_rule" "catalogue_app_alb" {
  type                     = "ingress"
  description              = "Allowing por number 8080 form vpn "
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = module.app_alb_sg.security_group_id
  #cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  #ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = module.catalogue_sg.security_group_id
}

resource "aws_security_group_rule" "app_alb_vpn" {
  type                     = "ingress"
  description              = "Allowing por number 80 form vpn "
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = module.vpn_sg.security_group_id
  #cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  #ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = module.app_alb_sg.security_group_id
}

resource "aws_security_group_rule" "app_alb_web" {
  type                     = "ingress"
  description              = "Allowing por number 8080 form web "
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = module.web_sg.security_group_id
  #cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  #ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = module.app_alb_sg.security_group_id
}

resource "aws_security_group_rule" "web_vpn" {
  type                     = "ingress"
  description              = "Allowing por number 80 form vpn "
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = module.vpn_sg.security_group_id
  #cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  #ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = module.web_sg.security_group_id
}

resource "aws_security_group_rule" "web_web_alb" {
  type                     = "ingress"
  description              = "Allowing por number 80 form web vpn "
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = module.web_alb_sg.security_group_id
  #cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  #ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = module.web_sg.security_group_id
}

resource "aws_security_group_rule" "web_alb_internet" {
  type        = "ingress"
  description = "Allowing por number 80 form internet vpn "
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  #source_security_group_id = module.web_alb_sg.security_group_id
  #cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  #ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = module.web_alb_sg.security_group_id
}

resource "aws_security_group_rule" "web_alb_internet_https" {
  type        = "ingress"
  description = "Allowing por number 80 form internet vpn "
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  #source_security_group_id = module.web_alb_sg.security_group_id
  #cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  #ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = module.web_alb_sg.security_group_id
}
=======
module "vpn_sg" {
  source         = "../../terraform-aws-securitygroup"
  project_name   = var.project_name
  sg_name        = "roboshop-vpn"
  sg_description = "allowing all ports form my home IP"
  #sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_vpc.default.id
  common_tags = merge(
    var.common_tags,
    {
      component = "VPN"
      Name      = "roboshop-vpn"
    }
  )

}

module "web_sg" {
  source         = "../../terraform-aws-securitygroup"
  project_name   = var.project_name
  sg_name        = "web-sg"
  sg_description = "allowing all traffic form catalogue and user and vpn"
  #sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = merge(
    var.common_tags,
    {
      component = "web"
    }
  )

}

module "app_alb_sg" {
  source         = "../../terraform-aws-securitygroup"
  project_name   = var.project_name
  sg_name        = "App-Alb"
  sg_description = "allowing all traffic form catalogue and user and vpn"
  #sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = merge(
    var.common_tags,
    {
      component = "App",
      Name      = "App-Alb"
    }
  )

}


module "web_alb_sg" {
  source         = "../../terraform-aws-securitygroup"
  project_name   = var.project_name
  sg_name        = "web_alb_sg"
  sg_description = "allowing all traffic form catalogue and user and vpn"
  #sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = merge(
    var.common_tags,
    {
      component = "web",
      Name      = "web_alb_sg"
    }
  )

}




module "mongodb_sg" {
  source         = "../../terraform-aws-securitygroup"
  project_name   = var.project_name
  sg_name        = "mongodb-sg"
  sg_description = "allowing all traffic form catalogue and user and vpn"
  #sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = merge(
    var.common_tags,
    {
      component = "MongoDB"
      Name      = "mongodb"
    }
  )

}


module "catalogue_sg" {
  source         = "../../terraform-aws-securitygroup"
  project_name   = var.project_name
  sg_name        = "catalogue-sg"
  sg_description = "allowing all traffic form catalogue and user and vpn"
  #sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = merge(
    var.common_tags,
    {
      component = "catalogue"
      Name      = "catalogue"
    }
  )

}


#this is allowing all catalogue instances to mongodb
resource "aws_security_group_rule" "mongodb_catalogue" {
  type                     = "ingress"
  description              = "Allowing por number 27017 form catalogue"
  from_port                = 27017
  to_port                  = 27017
  protocol                 = "tcp"
  source_security_group_id = module.catalogue_sg.security_group_id
  #cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  #ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = module.mongodb_sg.security_group_id
}
#this is allowing traffic from port no 22 for trouble shooting purposer
resource "aws_security_group_rule" "mongodb_vpn" {
  type                     = "ingress"
  description              = "Allowing por number 27017 form catalogue"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = module.vpn_sg.security_group_id
  #cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  #ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = module.mongodb_sg.security_group_id
}



resource "aws_security_group_rule" "vpn" {
  type        = "ingress"
  from_port   = 0
  to_port     = 65535
  protocol    = "tcp"
  cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  #ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = module.vpn_sg.security_group_id
}

resource "aws_security_group_rule" "catalogue_vpn" {
  type                     = "ingress"
  description              = "Allowing por number 22 form vpn "
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = module.vpn_sg.security_group_id
  #cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  #ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = module.catalogue_sg.security_group_id
}

resource "aws_security_group_rule" "catalogue_app_alb" {
  type                     = "ingress"
  description              = "Allowing por number 8080 form vpn "
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = module.app_alb_sg.security_group_id
  #cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  #ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = module.catalogue_sg.security_group_id
}

resource "aws_security_group_rule" "app_alb_vpn" {
  type                     = "ingress"
  description              = "Allowing por number 80 form vpn "
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = module.vpn_sg.security_group_id
  #cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  #ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = module.app_alb_sg.security_group_id
}

resource "aws_security_group_rule" "app_alb_web" {
  type                     = "ingress"
  description              = "Allowing por number 8080 form web "
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = module.web_sg.security_group_id
  #cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  #ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = module.app_alb_sg.security_group_id
}

resource "aws_security_group_rule" "web_vpn" {
  type                     = "ingress"
  description              = "Allowing por number 80 form vpn "
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = module.vpn_sg.security_group_id
  #cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  #ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = module.web_sg.security_group_id
}

resource "aws_security_group_rule" "web_web_alb" {
  type                     = "ingress"
  description              = "Allowing por number 80 form web vpn "
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = module.web_alb_sg.security_group_id
  #cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  #ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = module.web_sg.security_group_id
}

resource "aws_security_group_rule" "web_alb_internet" {
  type        = "ingress"
  description = "Allowing por number 80 form internet vpn "
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  #source_security_group_id = module.web_alb_sg.security_group_id
  #cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  #ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = module.web_alb_sg.security_group_id
}

resource "aws_security_group_rule" "web_alb_internet_https" {
  type        = "ingress"
  description = "Allowing por number 80 form internet vpn "
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  #source_security_group_id = module.web_alb_sg.security_group_id
  #cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  #ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = module.web_alb_sg.security_group_id
}
>>>>>>> 98c8a0ec3b321c5063076b9a24dab275f339acd6
