//terraform {
//  required_version = ">= 0.12, < 0.13"
//}
//
//provider "aws" {
//  region = var.aws_region
//
//  # Allow any 2.x version of the AWS provider
//  version = "~> 2.0"
//}
//
//terraform {
//  backend "s3" {}
//}

resource "aws_vpc" "production_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  tags = local.tags
}


