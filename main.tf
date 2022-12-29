# Terraform module for EC2

// Retrieve prerequisities 
data "aws_vpc" "ec2_vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.vpc_name}"]
  }
}
data "aws_subnet" "ec2_subnet" {
  filter {
    name   = "tag:Name"
    values = ["${var.subnet_name}"]
  }
  vpc_id = data.aws_vpc.ec2_vpc.id
}

// Embeded Security Group
resource "aws_security_group" "ec2_sg" {
  description = "Security Group for RDS ${var.ec2_security_group_name}"
  name        = var.ec2_security_group_name
  vpc_id      = data.aws_vpc.ec2_vpc.id
  tags = merge(
    var.global_tags,
    tomap({ "Environment" : "${var.Environment}",
    "Project" : "${var.Project}" })
  )
}

// EC2 Instance
resource "aws_instance" "ec2" {
  ami                  = var.ec2_ami
  instance_type        = var.ec2_instance_type
  iam_instance_profile = var.ec2_iam_instance_profile
  user_data            = <<-EOF
              #!/bin/bash
              echo ECS_CLUSTER=${var.ecs_cluster_name} >> /etc/ecs/ecs.config
              EOF
  network_interface {
    network_interface_id = aws_network_interface.ec2_nic.id
    device_index         = 0
  }
  tags = merge(
    var.global_tags,
    tomap({ "Environment" : "${var.Environment}",
      "Project" : "${var.Project}",
    "Name" : "${var.ec2_instance_name}" })
  )
}

// EC2 Network interface
resource "aws_network_interface" "ec2_nic" {
  subnet_id       = data.aws_subnet.ec2_subnet.id
  security_groups = [aws_security_group.ec2_sg.id]
  tags = merge(
    var.global_tags,
    tomap({ "Environment" : "${var.Environment}",
    "Project" : "${var.Project}" })
  )
}