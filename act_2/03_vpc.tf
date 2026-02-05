data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name        = "${var.lastname}-TFAct2-vpc"
    Engineer    = var.fullname
    ProjectCode = var.project_code
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "${var.lastname}-TFAct2-igw"
    Engineer    = var.fullname
    ProjectCode = var.project_code
  }
}

resource "aws_subnet" "public" {
  count      = length(var.public_subnets)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnets[count.index]

  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name        = "${var.lastname}-TFAct2-public-subnet-${count.index + 1}"
    Engineer    = var.fullname
    ProjectCode = var.project_code
  }
}

resource "aws_subnet" "private" {
  count      = length(var.private_subnets)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnets[count.index]

  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name        = "${var.lastname}-TFAct2-private-subnet-${count.index + 1}"
    Engineer    = var.fullname
    ProjectCode = var.project_code
  }
}
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name        = "${var.lastname}-TFAct1-public-rt"
    Engineer    = var.fullname
    ProjectCode = var.project_code
  }
}
resource "aws_route_table_association" "public_assoc" {
  count          = length(var.public_subnets)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_rt.id
}