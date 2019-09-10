locals {
  environment = ["test","accept","production"]
  application = ["frontend","backend"]
}

resource "random_string" "name" {
  length = 5
  special = false
  lower = true
  upper = false
}

resource "aws_codecommit_repository" "backend-repository" {
  repository_name = "${var.repository_base_name}-${random_string.name.result}"
  description     = "${var.repository_base_name}-${random_string.name.result}"
  lifecycle {
    prevent_destroy = false
  }
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "~> 1.66.0"
  name = "${var.service_name}"
  cidr = "${var.cidr}"

  azs             = "${var.availability_zone_names}"
  private_subnets = "${var.private_subnets}"
  public_subnets  = "${var.public_subnets}"

  enable_nat_gateway = true

  tags = {
    Terraform = "true"
    Name = "${var.service_name}"
    Stage = "${local.environment[0]}"
    Playground = "yes"
    Application = "${var.service_name}"
    Internal = "yes"
    Ephemeral = "no"
  }
}


/*====
ECS cluster
======*/
resource "aws_ecs_cluster" "ecs-cluster" {
  name = "${local.environment[0]}-${var.service_name}-ecs-cluster"
}

