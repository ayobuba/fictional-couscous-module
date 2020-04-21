variable "aws_region" {
  type        = string
  description = "AWS Region."
  default     = "us-east-2"
}

variable "app_name" {
  type        = string
  description = "UpRunningTasks"
  default     = "Layer-1"
}

variable "app_instance" {
  type        = string
  description = "Application instance name (ie. honolulu, customer_name, department, etc.)."
  default     = "VPC"
}

variable "app_stage" {
  type        = string
  description = "Application stage (ie. dev, prod, qa, etc)."
  default     = "prod"
}

variable "global_tags" {
  type = map(string)

  default = {
    Provisioner = "Terraform"
    Owner       = "shekarau buba"
    Name = "Production-VPC"
  }
}

variable "ami" {
  type = string
  description = "Default ami used in the tutorial"
  default = "ami-0c55b159cbfafe1f0"
}

variable "instance_type" {
  type = string
  description = "default instance type"
  default = "t2.micro"
}

variable "http_port" {
  type = number
  description = "http port"
  default = 8080
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  description = "Public Subnet 1 CIDR"
}

variable "public_subnet_2_cidr" {
  description = "Public Subnet 2 CIDR"
}

variable "public_subnet_3_cidr" {
  description = "Public Subnet 3 CIDR"
}

variable "private_subnet_3_cidr" {
  description = "Private Subnet 3 CIDR"
}

variable "private_subnet_2_cidr" {
  description = "Private Subnet 2 CIDR"
}

variable "private_subnet_1_cidr" {
  description = "Private Subnet 1 CIDR"
}
