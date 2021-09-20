variable "env" {
  description = "Name of the environment to deploy the resource."
}
variable "product" {
  description = "Name of the product."
  default     = "shared-image-gallery"
}

variable "location" {
  description = "Azure location to deploy the resource"
  default     = "UK South"
}

variable "builtFrom" {
  description = "Name of the GitHub repository this application is being built from."
}

variable "resource_group_name" {
  default = "hmcts-image-gallery-rg"
}

variable "image_gallery_name" {
  default = "hmcts"
}

variable "image_name" {
  default = "bastion-ubuntu"
}