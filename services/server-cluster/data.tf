data "aws_caller_identity" "current" {}

data "aws_iam_account_alias" "current" {}

data "terraform_remote_state" "network_configuration" {
  backend = "s3"
  config = {
    bucket = var.remote_state_bucket
    key = "layer1/infrastructure.tfstate"
    region = var.aws_region
  }
}

data "aws_ami" "launch_configuration_ami" {
  owners = ["amazon"]
  most_recent = true


  filter {
    name = "owner-alias"
    values = ["amazon"]
  }
}

//data "aws_instances" "web-app-production-instances" {
//  instance_tags = {
//    Type = var.tag_webapp
//  }
//  filter {
//    name   = "instance.group-id"
//    values = [
//      aws_security_group.ec2_public_security_group.id]
//  }
//
//  instance_state_names = [ "running", "stopped" ]
//  depends_on           = ["aws_autoscaling_group.ec2_public_asg"]
//}
//
//data "aws_instances" "backend-production-instances" {
//  instance_tags = {
//    Type = var.tag_backend
//  }
//  filter {
//    name   = "instance.group-id"
//    values = [
//      aws_security_group.ec2_private_security_group.id]
//  }
//
//  instance_state_names = [ "running", "stopped" ]
//  depends_on           = ["aws_autoscaling_group.ec2_private_asg"]
//}

