# AWS_EC2
 
 ## Description
 
 Deploy AWS EC2 Instance by using a dedicated Terraform module. 
 
 ## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.34.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.34.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.ec2](https://registry.terraform.io/providers/hashicorp/aws/4.34.0/docs/resources/instance) | resource |
| [aws_network_interface.ec2_nic](https://registry.terraform.io/providers/hashicorp/aws/4.34.0/docs/resources/network_interface) | resource |
| [aws_security_group.ec2_sg](https://registry.terraform.io/providers/hashicorp/aws/4.34.0/docs/resources/security_group) | resource |
| [aws_subnet.ec2_subnet](https://registry.terraform.io/providers/hashicorp/aws/4.34.0/docs/data-sources/subnet) | data source |
| [aws_vpc.ec2_vpc](https://registry.terraform.io/providers/hashicorp/aws/4.34.0/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_Environment"></a> [Environment](#input\_Environment) | Name of the working environment | `string` | `"dev"` | no |
| <a name="input_Project"></a> [Project](#input\_Project) | Project Name | `string` | `"project_test"` | no |
| <a name="input_ec2_ami"></a> [ec2\_ami](#input\_ec2\_ami) | AMI of the instance EC2 | `string` | n/a | yes |
| <a name="input_ec2_iam_instance_profile"></a> [ec2\_iam\_instance\_profile](#input\_ec2\_iam\_instance\_profile) | EC2 IAM Instance Profile | `string` | `"ecsInstanceRole"` | no |
| <a name="input_ec2_instance_name"></a> [ec2\_instance\_name](#input\_ec2\_instance\_name) | Name of the instance EC2 | `string` | `"ec2_test"` | no |
| <a name="input_ec2_instance_type"></a> [ec2\_instance\_type](#input\_ec2\_instance\_type) | EC2 instance type | `string` | `"t3.micro"` | no |
| <a name="input_ec2_security_group_name"></a> [ec2\_security\_group\_name](#input\_ec2\_security\_group\_name) | EC2 Security Group Name | `string` | `"ec2_default_sg"` | no |
| <a name="input_ecs_cluster_name"></a> [ecs\_cluster\_name](#input\_ecs\_cluster\_name) | ECS Cluster Name associated to EC2 instance | `string` | `"default_ecs_clu"` | no |
| <a name="input_global_tags"></a> [global\_tags](#input\_global\_tags) | Global tags for each resources | `map(string)` | <pre>{<br>  "ManagedBy": "Terraform",<br>  "Module_tf": "ec2"<br>}</pre> | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Name of the Subnet | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of VPC associated to the Load Balancer | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_instance"></a> [aws\_instance](#output\_aws\_instance) | Output EC2 Instance object attributes |
