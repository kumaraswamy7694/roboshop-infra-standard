<<<<<<< HEAD
locals {

  db_subnet_id = element(split(",", data.aws_ssm_parameter.database_subnet_ids.value), 0)
}
=======
locals {

  db_subnet_id = element(split(",", data.aws_ssm_parameter.database_subnet_ids.value), 0)
}
>>>>>>> 98c8a0ec3b321c5063076b9a24dab275f339acd6
