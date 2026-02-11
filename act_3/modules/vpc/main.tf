#VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name        = "${var.last_name}-TFAct3-vpc"
    Engineer    = "${var.last_name}-${var.first_name}"
    ProjectCode = var.project_code
  }
}

#Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name        = "${var.last_name}-TFAct3-igw"
    Engineer    = "${var.last_name}-${var.first_name}"
    ProjectCode = var.project_code
  }
}

#Public Subnets
resource "aws_subnet" "public" {
  count             = 2
  vpc_id            = aws_vpc.main.id
  cidr_block        = count.index == 0 ? "10.0.1.0/24" : "10.0.2.0/24"
  availability_zone = var.availability_zones[count.index]
  tags = { Name = "${var.last_name}-TFAct3-public-sn-${count.index + 1}" }
  map_public_ip_on_launch = true
}

#Private Subnets
resource "aws_subnet" "private" {
  count             = 2
  vpc_id            = aws_vpc.main.id
  cidr_block        = count.index == 0 ? "10.0.3.0/24" : "10.0.4.0/24"
  availability_zone = var.availability_zones[count.index]
  tags = { Name = "${var.last_name}-TFAct3-private-sn-${count.index + 1}" }
}

#Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_assoc" {
  count          = 2
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}