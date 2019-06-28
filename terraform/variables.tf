# service_name should be unique
# used in naming cloud of services where possible
variable "service_name" {
  default = "app-${random_string.name.result}"
}

variable "repository_base_name" {
  default = "app-${random_string.name.result}"
}

variable "region" {
  default = "eu-central-1"
}

