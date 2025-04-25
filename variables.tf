
variable "region" {
  default = "ap-southeast-1"
}

variable "drupal_image" {
  description = "Custom Docker image for Drupal with modules"
  default     = "YOUR_CUSTOM_DRUPAL_IMAGE"
}

variable "db_name" {
  default = "drupal"
}

variable "db_user" {
  default = "drupaluser"
}

variable "db_password" {
  default = "secureDrupalP@ss123"
}

variable "db_allocated_storage" {
  default = 1
}

variable "domain_name" {
  description = "Domain name to associate with the ALB (for ACM SSL)"
  default     = "example.com"
}
