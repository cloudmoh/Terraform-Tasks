# Initialize the Terraform AWS provider
provider "aws" {
  region = "ap-south-1" # Change this to your desired AWS region
}

# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

# Create three subnets in different availability zones
resource "aws_subnet" "subnet_a" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_b" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_c" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-south-1c"
  map_public_ip_on_launch = true
}

# Create two EC2 instances in different subnets
resource "aws_instance" "instance_a" {
  ami           = "ami-0f5ee92e2d63afc18" # Change to the desired AMI ID
  instance_type = "t2.micro"             # Change to your desired instance type
  subnet_id     = aws_subnet.subnet_a.id
}

resource "aws_instance" "instance_b" {
  ami           = "ami-0f5ee92e2d63afc18" # Change to the desired AMI ID
  instance_type = "t2.micro"             # Change to your desired instance type
  subnet_id     = aws_subnet.subnet_b.id
}
