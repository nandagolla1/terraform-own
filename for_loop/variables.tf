variable "ami_id" {
  type        = string
  description = "join devops ami id RHEL9"
  default     = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "aws_instance_tags" {
  type = map(string)
  default = {
    "Name" = "Roboshop"
  }
}

variable "sg_tags" {
  type = map(string)
  default = {
    Name    = "allow_all"
    Purpose = "security to the instance"
  }
}

variable "sg_description" {
  type    = string
  default = "Allow TLS inbound traffic and all outbound traffic"
}

variable "from_port" {
  default = 0
}

variable "to_port" {
  default = 0
}

variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "environment" {

}

variable "instances" {
  type    = map(string)
  default = {
    mongodb = "t3.micro"
    redis = "t3.micro"
    mysql = "t3.small"
    rabbitmq = "t3.micro"
  }
}

variable "zone_id" {
  default = "Z0241085GWXCWOXHL9YW"
}

variable "domain_name" {
  default = "nanda.cyou"
}