resource "aws_vpc" "AprilDevOpsVPC" {
    cidr_block = var.cidr
    enable_dns_hostnames = var.dns_hostname

    tags = {
        Name = "AprilDevOpsVPC"
    }   
}

data "aws_availability_zones" "available" {
  state = "available"
}


resource "aws_subnet" "AprilDevOpsPubnetLondon" {
    cidr_block = var.public_cidr_London
    availability_zone = data.aws_availability_zones.available.names[0]
    vpc_id = aws_vpc.AprilDevOpsVPC.id

    tags = {
        Name = "AprilDevOpsPubnetLondon"
    }
}

resource "aws_subnet" "AprilDevOpsPubnetParis" {
    cidr_block = var.public_cidr_Paris
    availability_zone = data.aws_availability_zones.available.names[0]
    vpc_id = aws_vpc.AprilDevOpsVPC.id

    tags = {
        Name = "AprilDevOpsPubnetParis"
    }
}

resource "aws_subnet" "AprilDevOpsPubnetMumbai" {
    cidr_block = var.public_cidr_Paris
    availability_zone = data.aws_availability_zones.available.names[0]
    vpc_id = aws_vpc.AprilDevOpsVPC.id

    tags = {
        Name = "AprilDevOpsPubnetMumbai"
    }
}


resource "aws_internet_gateway" "vpc_igw" {
  vpc_id = aws_vpc.AprilDevOpsVPC.id

  tags = {
    Name = "VPC Internet Gateway"
  }

}

resource "aws_route_table" "vpc_rt" {
  vpc_id = aws_vpc.AprilDevOpsVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_igw.id
  }

  tags = {
    Name = "Route Table for VPC"
  }
}

resource "aws_route_table_association" "pub_subLondon_rta" {
  subnet_id      = aws_subnet.AprilDevOpsPubnetLondon.id
  route_table_id = aws_route_table.vpc_rt.id
}

resource "aws_route_table_association" "pub_subParis_rta" {
  subnet_id      = aws_subnet.AprilDevOpsPubnetParis.id
  route_table_id = aws_route_table.vpc_rt.id
}

resource "aws_route_table_association" "pub_subMumbai_rta" {
  subnet_id      = aws_subnet.AprilDevOpsPubnetMumbai.id
  route_table_id = aws_route_table.vpc_rt.id
}