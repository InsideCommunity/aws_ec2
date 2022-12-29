# Variables file

# Global variables
variable "Environment" {
  description = "Name of the working environment"
  type        = string
  default     = "dev"
}
variable "Project" {
  description = "Project Name"
  type        = string
  default     = "project_test"
}
variable "global_tags" {
  description = "Global tags for each resources"
  type        = map(string)
  default = {
    ManagedBy : "Terraform",
    Module_tf : "ec2"
  }
}

# Module Variables
variable "ec2_instance_name" {
  description = "Name of the instance EC2"
  type        = string
  default     = "ec2_test"
}
variable "ec2_iam_instance_profile" {
  description = "EC2 IAM Instance Profile"
  type        = string
  default     = "ecsInstanceRole"
}
variable "ec2_ami" {
  description = "AMI of the instance EC2"
  type        = string
}
variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

# From Networking
variable "subnet_name" {
  description = "Name of the Subnet"
  type        = string
}
variable "vpc_name" {
  description = "Name of VPC associated to the Load Balancer"
  type        = string
}
# From SecurityGroups
variable "ec2_security_group_name" {
  description = "EC2 Security Group Name"
  default     = "ec2_default_sg"
}
# From ECS Cluster
variable "ecs_cluster_name" {
  description = "ECS Cluster Name associated to EC2 instance"
  default     = "default_ecs_clu"
}