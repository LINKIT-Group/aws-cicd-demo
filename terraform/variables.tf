# service_name should be unique
# used in naming cloud of services where possible
variable "service_name" {
  default = "app"
}

variable "repository_base_name" {
  default = "app"
}

variable "region" {
  default = "eu-central-1"
}

variable "availability_zone_names" {
  type    = "list"
  default = ["eu-central-1a", "eu-central-1b"]
}

variable "cidr" {
  default = "10.88.0.0/16"
}

variable "private_subnets" {
  type    = "list"
  default = ["10.88.1.0/24", "10.88.2.0/24"]
}

variable "public_subnets" {
  type    = "list"
  default = ["10.88.11.0/24", "10.88.12.0/24"]
}
