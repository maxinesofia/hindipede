data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_instance" "web_server" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name        = "${var.lastname}-TFAct2-ec2"
    Engineer    = var.fullname
    ProjectCode = var.project_code
  }
}