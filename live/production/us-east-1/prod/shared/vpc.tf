module "vpc" {
  application = var.application
  environment = var.environment
  source      = "../../../../../modules/vpc/"
  tags        = var.tags
}
