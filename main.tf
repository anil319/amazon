provider "aws" {
  region = var.aws_region

  default_tags {
    tags = var.tags
  }
}

# Networking Module
module "networking" {
  source = "./modules/networking"

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  environment          = var.environment
  project              = var.project
}

# IAM Module
module "iam" {
  source = "./modules/iam"

  project     = var.project
  environment = var.environment
}

# ECS Cluster Module
module "ecs_cluster" {
  source = "./modules/ecs-cluster"

  cluster_name = "${var.project}-${var.environment}-${var.cluster_name}"
  environment  = var.environment
  project      = var.project
}

# ECS Service Module
module "ecs_service" {
  source = "./modules/ecs-service"

  project                = var.project
  environment            = var.environment
  vpc_id                 = module.networking.vpc_id
  public_subnet_ids      = module.networking.public_subnet_ids
  private_subnet_ids     = module.networking.private_subnet_ids
  cluster_id             = module.ecs_cluster.cluster_id
  service_name           = var.service_name
  container_image        = var.container_image
  container_port         = var.container_port
  desired_count          = var.desired_count
  cpu                    = var.cpu
  memory                 = var.memory
  task_execution_role_arn = module.iam.task_execution_role_arn
  task_role_arn          = module.iam.task_role_arn
  health_check_path      = var.health_check_path
  alb_name               = var.alb_name
}