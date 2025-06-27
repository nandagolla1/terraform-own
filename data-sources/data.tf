data "aws_ami" "joindevops" {
  most_recent = true
  owners = ["430118818954"]

  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


output "ami_id" {
  value = data.aws_ami.joindevops.id
}
