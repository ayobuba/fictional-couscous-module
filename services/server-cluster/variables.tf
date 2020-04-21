variable "aws_region" {
  type        = string
  description = "AWS Region."
  default     = "us-east-2"
}

variable "app_name" {
  type        = string
  description = "UpRunningTasks"
  default     = "Layer-2"
}

variable "app_instance" {
  type        = string
  description = "Application instance name (ie. honolulu, customer_name, department, etc.)."
  default     = "instance"
}

variable "app_stage" {
  type        = string
  description = "Application stage (ie. dev, prod, qa, etc)."

}

variable "global_tags" {
  type = map(string)

  default = {
    Provisioner = "Terraform"
    Owner       = "shekarau buba"
  }
}

variable "ami" {
  type = string
  description = "Default ami used in the tutorial"
  default = "ami-097834fcb3081f51a"
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

variable "remote_state_bucket" {
  description = "Bucket name for layer 1 remote state"
}

variable "remote_state_key" {
  description = "Key name for layer 1 remote state"
}

variable "ec2_instance_type" {
  description = "EC2 instance type to launch"
}

variable "key_pair_name" {
  description = "EC2 Key-pair"
  default = "prenevate-useast2"
}

variable "max_instance_size" {
  description = "Maximum number of instances to launch"
}

variable "min_instance_size" {
  description = "Maximum number of instances to launch"
}

variable "tag_webapp" {
  default = "WebApp"
}

variable "tag_backend" {
  default = "Backend"
}