
/*----------------------------------------------------
  VPC Creation Block of Code.
 -----------------------------------------------------*/

resource "aws_vpc" "dic-prod-vpc" {
    cidr_block              = var.vpc_cidr
    enable_dns_support      = true 
    enable_dns_hostnames    = true 
    instance_tenancy        = "default"
    tags = {
        Name = "dic-prod-vpc"
    }
}

/*----------------------------------------------------
  VPC Internet Gateway Creation Code.
 -----------------------------------------------------*/

resource "aws_internet_gateway" "prod-vpc-igw" {
  vpc_id = aws_vpc.dic-prod-vpc.id

  tags = {
    Name = "dic-prod-vpc-igw"
  }
}

/*----------------------------------------------------
  VPC Subnets Creation Code.
 -----------------------------------------------------*/

resource "aws_subnet" "prod-pub-sbnt-1a" {
  vpc_id            = aws_vpc.dic-prod-vpc.id
  cidr_block        = var.pub_sbnt_1a_cidr
  map_public_ip_on_launch = true
  availability_zone = "ap-south-1a"

  tags = {
    Name = "prod-pub-sbnt-1a"
  }
}

resource "aws_subnet" "prod-pub-sbnt-1b" {
  vpc_id            = aws_vpc.dic-prod-vpc.id
  cidr_block        = var.pub_sbnt_1b_cidr
  map_public_ip_on_launch = true
  availability_zone = "ap-south-1b"

  tags = {
    Name = "prod-pub-sbnt-1b"
  }
}

resource "aws_subnet" "prod-pri-sbnt-1a" {
  vpc_id            = aws_vpc.dic-prod-vpc.id
  cidr_block        = var.pri_sbnt_1a_cidr
  map_public_ip_on_launch = false
  availability_zone = "ap-south-1a"

  tags = {
    Name = "prod-pri-sbnt-1a"
  }
}

resource "aws_subnet" "prod-pri-sbnt-1b" {
  vpc_id            = aws_vpc.dic-prod-vpc.id
  cidr_block        = var.pri_sbnt_1b_cidr
  map_public_ip_on_launch = false
  availability_zone = "ap-south-1b"

  tags = {
    Name = "prod-pri-sbnt-1b"
  }
}

/*------------------------------------------------------
  VPC Route Tables Creation Code.
 -------------------------------------------------------*/

resource "aws_route_table" "dic-prod-pub-rt" {
  vpc_id = aws_vpc.dic-prod-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod-vpc-igw.id
  }

  tags = {
    Name = "dic-prod-pub-rt"
  }
}

resource "aws_route_table" "dic-prod-pri-rt" {
  vpc_id = aws_vpc.dic-prod-vpc.id

  tags = {
    Name = "dic-prod-pri-rt"
  }
}

/*------------------------------------------------------
  VPC Route Tables Subnet Association Creation Code.
 -------------------------------------------------------*/

resource "aws_route_table_association" "prod-pub-rt-sbnt-1a-association" {
  subnet_id      = aws_subnet.prod-pub-sbnt-1a.id
  route_table_id = aws_route_table.dic-prod-pub-rt.id
  depends_on = [
    aws_subnet.prod-pub-sbnt-1a,
    aws_route_table.dic-prod-pub-rt
  ]
}

resource "aws_route_table_association" "prod-pub-rt-sbnt-1b-association" {
  subnet_id      = aws_subnet.prod-pub-sbnt-1b.id
  route_table_id = aws_route_table.dic-prod-pub-rt.id
  depends_on = [
    aws_subnet.prod-pub-sbnt-1b,
    aws_route_table.dic-prod-pub-rt
  ]
}

resource "aws_route_table_association" "prod-pri-rt-sbnt-1a-association" {
  subnet_id      = aws_subnet.prod-pri-sbnt-1a.id
  route_table_id = aws_route_table.dic-prod-pri-rt.id
  depends_on = [
    aws_subnet.prod-pri-sbnt-1a,
    aws_route_table.dic-prod-pri-rt
  ]
}

resource "aws_route_table_association" "prod-pri-rt-sbnt-1b-association" {
  subnet_id      = aws_subnet.prod-pri-sbnt-1b.id
  route_table_id = aws_route_table.dic-prod-pri-rt.id
  depends_on = [
    aws_subnet.prod-pri-sbnt-1b,
    aws_route_table.dic-prod-pri-rt
  ]
}