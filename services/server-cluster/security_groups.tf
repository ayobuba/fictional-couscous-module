################################
## Public Security Group      ##
################################

resource "aws_security_group" "ec2_public_security_group" {
  name = "EC2-Public-SG"
  description = "Internet reaching access for EC2 instances"
  vpc_id = data.terraform_remote_state.network_configuration.outputs.vpc_id

  ingress {
    from_port   = 80
    protocol    = "TCP"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    protocol    = "TCP"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]   # put own ip here when demonstrating
  }

  //  ingress {
  //    from_port   = 0
  //    protocol    = "-1"
  //    to_port     = 0
  //    cidr_blocks = ["0.0.0.0/0"]
  //  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

//resource "aws_security_group_rule" "ec2_public_ingress_tcp" {
//  from_port = 80
//  protocol = "tcp"
//  security_group_id = aws_security_group.ec2_public_security_group.id
//  to_port = 80
//  type = "ingress"
//  cidr_blocks = ["0.0.0.0/0"]
//}
//
//resource "aws_security_group_rule" "ec2_public_ingress_ssh" {
//  from_port = 22
//  protocol = "tcp"
//  security_group_id = aws_security_group.ec2_public_security_group.id
//  to_port = 22
//  type = "ingress"
//  cidr_blocks = ["105.112.112.110/32"]
//}
//
//resource "aws_security_group_rule" "ec2_public_egress" {
//  from_port = 0
//  protocol = "-1"
//  security_group_id = aws_security_group.ec2_public_security_group.id
//  to_port = 0
//  type = "egress"
//  cidr_blocks = ["0.0.0.0/0"]
//}

################################
## Private Security Group     ##
################################

resource "aws_security_group" "ec2_private_security_group" {
  name = "EC2-Private-SG"
  description = "Only allow public security group resources to access these instances"
  vpc_id = data.terraform_remote_state.network_configuration.outputs.vpc_id
  ingress {
    from_port       = 0
    protocol        = "-1"
    to_port         = 0
    security_groups = [aws_security_group.ec2_public_security_group.id]
  }

  ingress {
    from_port = 80
    protocol = "TCP"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow traffic for health checking, remember this doesnt allow public internet!"
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

//resource "aws_security_group_rule" "ec2_private_ingress" {
//  from_port = 0
//  protocol = "-1"
//  security_group_id = aws_security_group.ec2_public_security_group.id
//  to_port = 0
//  type = "ingress"
//
//
//}
//
//resource "aws_security_group_rule" "ec2_private_health_check" {
//  from_port = 80
//  protocol = "tcp"
//  security_group_id = aws_security_group.ec2_private_security_group.id
//  to_port = 80
//  type = "ingress"
//  description = "Allow health checking for instances using this SG"
//}
//
//resource "aws_security_group_rule" "ec2_private_egress" {
//  from_port = 0
//  protocol = "-1"
//  security_group_id = aws_security_group.ec2_private_security_group.id
//  to_port = 0
//  type = "egress"
//  cidr_blocks = ["0.0.0.0/0"]
//}

################################
## ELB Security Group         ##
################################

resource "aws_security_group" "elb_security_group" {
  name = "ELB-SG"
  description = "ELB security group"
  vpc_id = data.terraform_remote_state.network_configuration.outputs.vpc_id

  ingress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow web traffic to load balancer"
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
}


//resource "aws_security_group_rule" "elb_public_ingress_-1" {
//  from_port = 80
//  protocol = "-1"
//  security_group_id = aws_security_group.ec2_public_security_group.id
//  to_port = 80
//  type = "ingress"
//  cidr_blocks = ["0.0.0.0/0"]
//  description = "Allow web traffic to load balancer"
//}
//
//resource "aws_security_group_rule" "elb_public_egress_-1" {
//  from_port = 0
//  protocol = "-1"
//  security_group_id = aws_security_group.ec2_public_security_group.id
//  to_port = 0
//  type = "egress"
//  cidr_blocks = ["0.0.0.0/0"]

}
