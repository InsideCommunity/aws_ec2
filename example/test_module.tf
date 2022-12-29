# Sample test for module
module "test_ec2" {
  depends_on  = [aws_vpc.ec2_vpc_test]
  source      = "../"
  ec2_ami     = "ami-0fe0b2cf0e1f25c8a"
  subnet_name = "Subnet test module EC2"
  vpc_name    = "VPC Test module EC2"
}

# Create Test VPC
resource "aws_vpc" "ec2_vpc_test" {
  cidr_block = "10.36.0.0/24"
  tags = {
    Name      = "VPC Test module EC2"
    ManagedBy = "Terraform"
  }
}
# Create Test Subnet
resource "aws_subnet" "ec2_subnet" {
  vpc_id            = aws_vpc.ec2_vpc_test.id
  cidr_block        = "10.36.0.0/28"
  availability_zone = "eu-west-1c"
  tags = {
    Name      = "Subnet test module EC2"
    ManagedBy = "Terraform"
  }
}