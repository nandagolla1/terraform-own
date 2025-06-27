variable "Project" {
  default = "Roboshop"
}

variable "environment" {
  default = "dev"
}

variable "component" {
  default = "cart"
}

variable "common_tags" {
  default = {
    Project = "Roboshop"
    Terraform = "true"
  }
}
