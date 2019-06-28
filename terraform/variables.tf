# service_name should be unique
# used in naming cloud of services where possible
variable "service_name" {
  default = "app-demo"
}

variable "repository_base_name" {
  default = "app-demo"
}

variable "region" {
  default = "eu-central-1"
}

