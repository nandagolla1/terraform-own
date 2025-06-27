resource "aws_instance" "helloworld" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all.id]


  tags = var.aws_instance_tags
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = var.sg_description

  tags = var.sg_tags

  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port = ingress.value["from_port"]
      to_port = ingress.value["to_port"]
      protocol         = "-1"
      cidr_blocks      = var.cidr_blocks
      ipv6_cidr_blocks = ["::/0"]
    }
  }

  egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }
}
