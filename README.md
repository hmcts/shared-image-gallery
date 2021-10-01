# azure-image-gallery

This repo creates an Azure Shared Image Gallery to store image definitions and versions that can be used to build virtual machines.

A base image definition and version will also be created.

The base image version cannot be used to create a viable virtual machine.

In order to create an image version that can be used to create a viable virtual machine, use packer.

See example in https://github.com/hmcts/bastion-packer

To add a new image definition, update the images variable map in https://github.com/hmcts/shared-image-gallery/blob/master/components/shared-image-gallery/variables.tf

