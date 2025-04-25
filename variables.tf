
variable "region" {
  default = "ap-southeast-1"
}

variable "drupal_image" {
  default = "drupal:10-apache"
}

variable "db_name" {
  default = "drupal"
}

variable "db_user" {
  default = "drupaluser"
}

variable "db_password" {
  default = "Drupal123!"
}

variable "db_allocated_storage" {
  default = 20
}
