variable "env" {
  description = "Name of the environment to deploy the resource."
}
variable "product" {
  description = "Name of the product."
  default     = "shared-image-gallery"
}

variable "builtFrom" {
  description = "Name of the GitHub repository this application is being built from."
}

variable "jenkins-mi" {
  default = ["jenkins-cftptl-intsvc-mi", "jenkins-cftsbox-intsvc-mi", "jenkins-ptl-mi"]
}