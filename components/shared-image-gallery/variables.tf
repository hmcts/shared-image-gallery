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

variable "images" {
  type = map(any)
  default = {
    "jenkins-agent" = {
      "sku"           = "7_9"
      "vm_generation" = "V1"
    },
    "bastion-ubuntu" = {
      "sku"           = "18.04-LTS"
      "vm_generation" = "V1"
    },
    "jenkins-ubuntu" = {
      "sku"           = "20.04-LTS"
      "vm_generation" = "V1"
    },
    "jenkins-ubuntu-arm" = {
      "architecture"  = "Arm64"
      "sku"           = "20.04-LTS"
      "vm_generation" = "V2"
    },
    "devops-ubuntu" = {
      "sku"           = "22.04-LTS"
      "vm_generation" = "V2"
    },
    "jenkins-ubuntu-v2" = {
      "sku"           = "24.04-LTS"
      "vm_generation" = "V2"
    }
  }
}
