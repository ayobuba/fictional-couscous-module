resource "aws_autoscaling_group" "ec2_private_asg" {
  name = "Production-BackEnd-AutoScalingGroup"
  vpc_zone_identifier = [
    data.terraform_remote_state.network_configuration.outputs.private_subnet_1_id,
    data.terraform_remote_state.network_configuration.outputs.private_subnet_2_id,
    data.terraform_remote_state.network_configuration.outputs.private_subnet_3_id
  ]
  max_size = var.max_instance_size
  min_size = var.min_instance_size
  launch_configuration = aws_launch_configuration.ec2_private_launch_configuration.name
  health_check_type = "ELB"
  load_balancers = [aws_elb.backend_load_balancer.name]

  tag {
    key = "Name"
    propagate_at_launch = false
    value = "Backend-EC2-Instances"
  }

  tag {
    key = "Type"
    propagate_at_launch = false
    value = "BackEnd"
  }

  tag {
    key = "DeployedBy"
    propagate_at_launch = false
    value = "Terraform"
  }
}

resource "aws_autoscaling_group" "ec2_public_asg" {
  name = "Production-WebApp-AutoScalingGroup"
  vpc_zone_identifier = [
    data.terraform_remote_state.network_configuration.outputs.public_subnet_1_id,
    data.terraform_remote_state.network_configuration.outputs.public_subnet_2_id,
    data.terraform_remote_state.network_configuration.outputs.public_subnet_3_id
  ]
  max_size = var.max_instance_size
  min_size = var.min_instance_size
  launch_configuration = aws_launch_configuration.ec2_public_launch_configuration.name
  health_check_type = "ELB"
  load_balancers = [aws_elb.webapp_load_balancer.name]

  tag {
    key = "Name"
    propagate_at_launch = false
    value = "WebApp-EC2-Instances"
  }

  tag {
    key = "Type"
    propagate_at_launch = false
    value = "WebApp"
  }

  tag {
    key = "DeployedBy"
    propagate_at_launch = false
    value = "Terraform"
  }
}

resource "aws_autoscaling_policy" "webapp_production_scaling_policy" {
  autoscaling_group_name = aws_autoscaling_group.ec2_public_asg.name
  name = "Production-WebApp-AutoScaling-Policy"
  policy_type = "TargetTrackingScaling"
  min_adjustment_magnitude = 1

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 80.0
  }
}

resource "aws_autoscaling_policy" "backend_production_scaling_policy" {
  autoscaling_group_name = aws_autoscaling_group.ec2_private_asg.name
  name = "Production-BackEnd-AutoScaling-Policy"
  policy_type = "TargetTrackingScaling"
  min_adjustment_magnitude = 1

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 80.0
  }
}




