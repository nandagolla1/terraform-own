resource "aws_instance" "helloworld" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all.id]


  tags = var.aws_instance_tags

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }


  provisioner "local-exec" {
  command = "echo ${self.private_ip} > inventory"
  on_failure = continue
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
    ]
  }

  provisioner "remote-exec" {
  when = destroy
  inline = [
    "sudo systemctl stop nginx"
  ]
  }

}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = var.sg_description

  tags = var.sg_tags

  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }
}
